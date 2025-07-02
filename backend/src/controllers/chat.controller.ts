import { ServerUnaryCall, sendUnaryData, ServerDuplexStream, status } from '@grpc/grpc-js';
import ChatMessageModel from '../models/chat.model';
import mongoose from 'mongoose';

// Define complex types from the proto file.
// In a real project, these would be generated.
interface ConversationStream {
    setup?: { sender_id: string; receiver_id: string; };
    new_message?: { content: string; };
    chat_message?: ChatMessage;
    status_update?: { message_id: string; status: 'SENT' | 'DELIVERED' | 'READ'; };
}

interface ChatMessage {
  id: string;
  sender_id: string;
  receiver_id: string;
  content: string;
  timestamp_ms: number;
  status: 'SENT' | 'DELIVERED' | 'READ';
}

interface GetChatHistoryRequest {
  user_id_1: string;
  user_id_2: string;
  page_size: number;
  page_number: number;
}

interface GetChatHistoryResponse {
  messages: ChatMessage[];
}


export class ChatController {
  // Key: "senderId:receiverId", Value: the stream
  private activeStreams = new Map<string, ServerDuplexStream<ConversationStream, ConversationStream>>();

  constructor() {
    this.converse = this.converse.bind(this);
    this.getChatHistory = this.getChatHistory.bind(this);
  }

  // Handler for the GetChatHistory RPC
  public async getChatHistory(
    call: ServerUnaryCall<GetChatHistoryRequest, GetChatHistoryResponse>,
    callback: sendUnaryData<GetChatHistoryResponse>
  ): Promise<void> {
    try {
      const { user_id_1, user_id_2, page_size = 20, page_number = 1 } = call.request;

      // Validate and sanitize pagination parameters
      const safePageSize = Math.max(1, Math.min(page_size || 20, 100)); // Between 1 and 100
      const safePageNumber = Math.max(1, page_number || 1); // At least 1
      const skipCount = Math.max(0, (safePageNumber - 1) * safePageSize); // Ensure non-negative

      console.log(`GetChatHistory: page_size=${page_size}, page_number=${page_number}, safePageSize=${safePageSize}, safePageNumber=${safePageNumber}, skipCount=${skipCount}`);

      const messages = await ChatMessageModel.find({
        $or: [
          { senderId: user_id_1, receiverId: user_id_2 },
          { senderId: user_id_2, receiverId: user_id_1 },
        ],
      })
      .sort({ timestamp: -1 })
      .skip(skipCount)
      .limit(safePageSize);
      // Removed .populate() to keep consistent ObjectId strings

      const chatMessages: ChatMessage[] = messages.map(msg => ({
        id: (msg._id as any).toString(),
        sender_id: (msg.senderId as any).toString(),
        receiver_id: (msg.receiverId as any).toString(),
        content: msg.content,
        timestamp_ms: msg.timestamp.getTime(),
        status: msg.status as 'SENT' | 'DELIVERED' | 'READ',
      }));

      console.log(`GetChatHistory returning ${chatMessages.length} messages`);
      chatMessages.forEach((msg, index) => {
        console.log(`Message ${index}: sender_id="${msg.sender_id}", receiver_id="${msg.receiver_id}", content="${msg.content}"`);
      });

      callback(null, { messages: chatMessages });
    } catch (error) {
      console.error('GetChatHistory error:', error);
      callback({
        code: status.INTERNAL,
        message: 'Error fetching chat history.',
      });
    }
  }

  public converse(
    call: ServerDuplexStream<ConversationStream, ConversationStream>
  ): void {
    let streamContext: { selfId: string, peerId: string } | null = null;

    call.on('data', async (streamData: ConversationStream) => {
      // 1. Handle Stream Setup
      if (streamData.setup) {
        if (streamContext) { // Disallow re-initialization
          call.emit('error', { code: status.FAILED_PRECONDITION, details: 'Stream already initialized.' });
          return;
        }

        const { sender_id, receiver_id } = streamData.setup;
        if (!mongoose.Types.ObjectId.isValid(sender_id) || !mongoose.Types.ObjectId.isValid(receiver_id)) {
          call.emit('error', { code: status.INVALID_ARGUMENT, details: 'Sender and receiver IDs must be valid ObjectIDs.' });
          return;
        }

        streamContext = { selfId: sender_id, peerId: receiver_id };
        const streamKey = `${sender_id}:${receiver_id}`;
        this.activeStreams.set(streamKey, call);
        console.log(`Stream registered for ${streamKey}`);

        // Optional: Confirm setup to the client
        call.write({ setup: { sender_id, receiver_id }});
        return;
      }
      
      // If no context, and not a setup message, it's an error.
      if (!streamContext) {
        call.emit('error', { code: status.FAILED_PRECONDITION, details: 'Stream not initialized.' });
        return;
      }
      
      // 2. Handle New Incoming Message
      if (streamData.new_message) {
        const { selfId, peerId } = streamContext;
        const { content } = streamData.new_message;
        
        // Save to DB
        const newChatMessage = new ChatMessageModel({
          senderId: new mongoose.Types.ObjectId(selfId),
          receiverId: new mongoose.Types.ObjectId(peerId),
          content: content,
        });
        await newChatMessage.save();
        
        const messageForTransport: ChatMessage = {
          id: (newChatMessage._id as any).toString(),
          sender_id: selfId,
          receiver_id: peerId,
          content: newChatMessage.content,
          timestamp_ms: newChatMessage.timestamp.getTime(),
          status: 'SENT',
        };

        // Forward to recipient if they are connected
        const recipientStreamKey = `${peerId}:${selfId}`;
        const recipientStream = this.activeStreams.get(recipientStreamKey);

        if (recipientStream) {
          messageForTransport.status = 'DELIVERED';
          recipientStream.write({ chat_message: messageForTransport });
          newChatMessage.status = 'delivered';
          await newChatMessage.save();
        }

        // Send confirmation back to sender
        call.write({ chat_message: messageForTransport });
      }

      // 3. Handle Status Update
      if (streamData.status_update) {
         // (Implementation for status updates would go here)
      }
    });

    call.on('end', () => {
      if (streamContext) {
        const streamKey = `${streamContext.selfId}:${streamContext.peerId}`;
        this.activeStreams.delete(streamKey);
        console.log(`Stream unregistered for ${streamKey}`);
      }
      call.end();
    });

    call.on('error', (err) => {
      console.error('Stream error:', err);
      if (streamContext) {
        const streamKey = `${streamContext.selfId}:${streamContext.peerId}`;
        this.activeStreams.delete(streamKey);
        console.log(`Stream unregistered for ${streamKey} due to error.`);
      }
    });
  }
} 