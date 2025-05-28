import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/routing/routing_service.dart';
import 'package:frontend/core/widgets/error.snackbar.dart';
import 'package:frontend/core/widgets/network.snackbar.dart';
import '../../../core/routing/routing_contants.dart';
import '../../auth/bloc/logout/logout_bloc.dart';
import '../../auth/bloc/logout/logout_event.dart';
import '../../auth/bloc/logout/logout_state.dart';
import '../widgets/chat.tile.dart';
import '../widgets/home.drawer.dart';
import '../widgets/online.chat.card.dart';

class _OnlineListDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    // Calculate the current height ensuring it stays within the allowed range.
    // Using a direct linear relation between shrinkOffset and height prevents
    // tiny floating-point rounding errors that can make layoutExtent slightly
    // larger than paintExtent (see Flutter issue #111906).
    final height = (maxExtent - shrinkOffset).clamp(minExtent, maxExtent);

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
            imageUrl:
                'https://upload.wikimedia.org/wikipedia/commons/f/f1/John_Cena_on_the_Impaulsive_podcast%2C_2024.png',
          );
        },
      ),
    );
  }

  @override
  double get maxExtent => 160.0;

  @override
  double get minExtent => 50.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}

class _ChatHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
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
            Theme.of(context).scaffoldBackgroundColor.withValues(alpha: 0.01),
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
            Text('Chats', style: Theme.of(context).textTheme.titleLarge),
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
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
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
        leading: Builder(
          builder:
              (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Icons.menu),
              ),
        ),
      ),
      drawer: HomeDrawer(
        name: 'John Cena',
        email: 'john.cena@gmail.com',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/f/f1/John_Cena_on_the_Impaulsive_podcast%2C_2024.png',
        onEditProfile: () {},
        onSettings: () {},
        onLogout: () async {
          context.read<LogoutBloc>().add(LogoutEvent.logout());
          NavigationService().goBack();
        },
      ),
      body: BlocListener<LogoutBloc, LogoutState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            success: (data) {
              NavigationService().navigateToAndRemoveUntil(
                RoutingConstants.initialScreen,
              );
            },
            error: (error) {
              showErrorSnackBar(context, error);
            },
            networkError: (error) {
              showNetworkSnackBar(context, error,(){
                context.read<LogoutBloc>().add(LogoutEvent.logout());
                NavigationService().goBack();
              });
            },
          );
        },
        child: CustomScrollView(
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
                delegate: SliverChildBuilderDelegate((context, index) {
                  return ChatTile(
                    name: 'John Cena',
                    imageUrl:
                        'https://upload.wikimedia.org/wikipedia/commons/f/f1/John_Cena_on_the_Impaulsive_podcast%2C_2024.png',
                    lastMessage: 'Hello',
                    lastMessageTime: '12:00',
                    unreadMessageCount: 2,
                    isOnline: true,
                    lastMessageStatus: 'sent',
                  );
                }, childCount: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
