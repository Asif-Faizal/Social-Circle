import 'package:flutter/material.dart';

import '../widgets/online.chat.card.dart';

class _OnlineListDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // Calculate progress for transitions
    final progress = (shrinkOffset / (maxExtent - minExtent)).clamp(0.0, 1.0);
    
    // Calculate height based on scroll progress and ensure it's clamped
    final height = (maxExtent - (progress * (maxExtent - minExtent))).clamp(minExtent, maxExtent);
    
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      height: height,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return OnlineChatCard(
            name: 'John Cena',
            imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/f/f1/John_Cena_on_the_Impaulsive_podcast%2C_2024.png',
          );
        },
      ),
    );
  }

  @override
  double get maxExtent => 180.0;

  @override
  double get minExtent => 50.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}

class _ChatHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: maxExtent,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        // Add a subtle gradient at the top to blend with the list
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).scaffoldBackgroundColor,
            Theme.of(context).scaffoldBackgroundColor.withValues(alpha: 0.9),
            Theme.of(context).scaffoldBackgroundColor.withValues(alpha:0.01),
          ],
          stops: const [0.0, 0.8, 1.0],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              'Chats',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 5),
            Divider(height: 1, thickness: 0.2),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 55.0;

  @override
  double get minExtent => 55.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          SizedBox(width: MediaQuery.of(context).size.width * 0.01),
        ],
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: _OnlineListDelegate(),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: _ChatHeaderDelegate(),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return ChatTile(
                    name: 'John Cena',
                    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/f/f1/John_Cena_on_the_Impaulsive_podcast%2C_2024.png',
                    lastMessage: 'Hello',
                    lastMessageTime: '12:00',
                    unreadMessageCount: 2,
                    isOnline: true,
                    lastMessageStatus: 'sent',
                  );
                },
                childCount: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
                right: 0,
                bottom: 0,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
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
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (unreadMessageCount > 0)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
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
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
        );
      case 'delivered':
        return Icon(
          Icons.done_all,
          size: 16,
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
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
