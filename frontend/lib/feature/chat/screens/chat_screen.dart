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

  @override
  void initState() {
    super.initState();
    // Connect to the chat stream when the screen is initialized
    context.read<ChatBloc>().add(ChatEvent.connect(
          selfId: widget.selfId,
          peerId: widget.peerId,
        ));
  }

  @override
  void dispose() {
    // Disconnect from the chat stream when the screen is disposed
    context.read<ChatBloc>().add(const ChatEvent.disconnect());
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
                  return const Center(child: CircularProgressIndicator());
                }
                
                if (stateTypeName.contains('Connected')) {
                  final connected = state as dynamic;
                  final messages = connected.messages as List<ChatMessageEntity>? ?? [];
                  if (messages.isEmpty) {
                    return const Center(child: Text("No messages yet. Say hi!"));
                  }
                  return ListView.builder(
                    reverse: true, // To show the latest messages at the bottom
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[messages.length - 1 - index];
                      final isMe = message.senderId == widget.selfId;
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
      context.read<ChatBloc>().add(ChatEvent.sendMessage(message: message));
      _messageController.clear();
    }
  }
} 