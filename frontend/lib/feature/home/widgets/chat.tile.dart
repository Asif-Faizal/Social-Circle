import 'package:flutter/material.dart';
class ChatTile extends StatelessWidget {
  const ChatTile({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.unreadMessageCount,
    required this.isOnline,
    required this.lastMessageStatus,
  });
  final String name;
  final String imageUrl;
  final String lastMessage;
  final String lastMessageTime;
  final bool isOnline;
  final int unreadMessageCount;
  final String lastMessageStatus;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        title: Row(
          children: [
            Expanded(
              child: Text(
                name,
                style: Theme.of(context).textTheme.titleMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              lastMessageTime,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
          ],
        ),
        leading: Stack(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
            ),
            if (isOnline)
              Positioned(
                right: -2,
                bottom: -2,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.2),
                        blurRadius: 2,
                        offset: const Offset(0, 2),
                      ),
                    ],
                    color: Colors.green,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      width: 2,
                    ),
                  ),
                ),
              ),
          ],
        ),
        subtitle: Row(
          children: [
            Expanded(
              child: Text(
                lastMessage,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (unreadMessageCount > 0)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.2),
                      blurRadius: 2,
                      offset: const Offset(0, 2),
                    ),
                  ],
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  unreadMessageCount.toString(),
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
          ],
        ),
        trailing: _getMessageStatusIcon(context),
      ),
    );
  }

  Widget _getMessageStatusIcon(BuildContext context) {
    switch (lastMessageStatus) {
      case 'sent':
        return Icon(
          Icons.check,
          size: 16,
          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
        );
      case 'delivered':
        return Icon(
          Icons.done_all,
          size: 16,
          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
        );
      case 'read':
        return Icon(
          Icons.done_all,
          size: 16,
          color: Theme.of(context).colorScheme.primary,
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
