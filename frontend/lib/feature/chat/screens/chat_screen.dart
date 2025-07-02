import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/feature/chat/bloc/chat_bloc.dart';
import 'package:frontend/feature/chat/domain/entities/chat_entity.dart';

import '../bloc/chat_event.dart';
import '../bloc/chat_state.dart';

class ChatScreen extends StatefulWidget {
  final String selfId;
  final String peerId;
  final String peerName;
  final String peerImageUrl;

  const ChatScreen({
    Key? key,
    required this.selfId,
    required this.peerId,
    required this.peerName,
    required this.peerImageUrl,
  }) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  ChatBloc? _chatBloc;

  @override
  void initState() {
    super.initState();
    // Store reference to the bloc for safe disposal
    _chatBloc = context.read<ChatBloc>();
    // Connect to the chat stream when the screen is initialized
    _chatBloc!.add(ChatEvent.connect(
          selfId: widget.selfId,
          peerId: widget.peerId,
        ));
  }

  @override
  void dispose() {
    // Disconnect from the chat stream when the screen is disposed
    // Use stored reference instead of accessing context
    try {
      _chatBloc?.add(const ChatEvent.disconnect());
    } catch (e) {
      print('Error disconnecting chat: $e');
    }
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.peerImageUrl),
            ),
            const SizedBox(width: 10),
            Text(widget.peerName),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatBloc, ChatState>(
              builder: (context, state) {
                final stateTypeName = state.runtimeType.toString();
                
                if (stateTypeName.contains('Connecting')) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 16),
                        Text("Connecting to chat..."),
                      ],
                    ),
                  );
                }
                
                if (stateTypeName.contains('Connected')) {
                  final connected = state as dynamic;
                  final messages = connected.messages as List<ChatMessageEntity>? ?? [];
                  final isLoadingHistory = connected.isLoadingHistory as bool? ?? false;
                  
                  // Show loading placeholder while chat history is being loaded
                  if (isLoadingHistory && messages.isEmpty) {
                    return const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(height: 16),
                          Text("Loading chat history..."),
                        ],
                      ),
                    );
                  }
                  
                  // Show empty state when history is loaded but no messages exist
                  if (!isLoadingHistory && messages.isEmpty) {
                    return const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.chat_bubble_outline,
                            size: 64,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 16),
                          Text(
                            "No messages yet. Say hi!",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  
                  return ListView.builder(
                    reverse: true, // To show the latest messages at the bottom
                    itemCount: messages.length + (isLoadingHistory ? 1 : 0),
                    itemBuilder: (context, index) {
                      // Show loading indicator at the top (last item when reversed)
                      if (isLoadingHistory && index == messages.length) {
                        return const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: CircularProgressIndicator(strokeWidth: 2),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  "Loading older messages...",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                      
                      final message = messages[messages.length - 1 - index];
                      final isMe = message.senderId == widget.selfId;
                      
                      // Debug print to check sender ID comparison
                      print('Message: "${message.content}"');
                      print('Message senderId: "${message.senderId}"');
                      print('Widget selfId: "${widget.selfId}"');
                      print('IsMe: $isMe');
                      print('---');
                      
                      return _buildMessageBubble(message, isMe);
                    },
                  );
                }
                
                if (stateTypeName.contains('Disconnected')) {
                  return const Center(child: Text("Disconnected from chat."));
                }
                
                if (stateTypeName.contains('Error')) {
                  final error = state as dynamic;
                  final message = error.message ?? 'Unknown error';
                  return Center(child: Text("Error: $message"));
                }
                
                return const Center(child: Text("Initializing chat..."));
              },
            ),
          ),
          _buildMessageInputField(),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(ChatMessageEntity message, bool isMe) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isMe ? Theme.of(context).primaryColor : Colors.grey[300],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          message.content,
          style: TextStyle(color: isMe ? Colors.white : Colors.black),
        ),
      ),
    );
  }

  Widget _buildMessageInputField() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'Type a message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onSubmitted: (_) => _sendMessage(),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: _sendMessage,
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    final message = _messageController.text.trim();
    if (message.isNotEmpty) {
      _chatBloc?.add(ChatEvent.sendMessage(message: message));
      _messageController.clear();
    }
  }
} 