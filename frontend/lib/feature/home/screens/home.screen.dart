import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/routing/routing_service.dart';
import 'package:frontend/core/widgets/error.snackbar.dart';
import 'package:frontend/core/widgets/network.snackbar.dart';
import '../../../core/routing/routing_contants.dart';
import '../../auth/bloc/logout/logout_bloc.dart';
import '../../auth/bloc/logout/logout_event.dart';
import '../../auth/bloc/logout/logout_state.dart';
import '../bloc/all_users/all_users_bloc.dart';
import '../bloc/all_users/all_users_event.dart';
import '../bloc/all_users/all_users_state.dart';
import '../bloc/user_details/user_details_bloc.dart';
import '../bloc/user_details/user_details_event.dart';
import '../bloc/user_details/user_details_state.dart';
import '../domain/entities/user.entity.dart';
import '../widgets/home.drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserEntity? currentUser;

  @override
  void initState() {
    super.initState();
    // Load current user details and all users
    context.read<UserDetailsBloc>().add(const UserDetailsEvent.getUserDetails());
    context.read<AllUsersBloc>().add(const AllUsersEvent.getAllUsers());
  }

  UserEntity? _getCurrentUser() {
    final userDetailsState = context.read<UserDetailsBloc>().state;
    final stateTypeName = userDetailsState.runtimeType.toString();
    
    if (stateTypeName.contains('Success')) {
      final success = userDetailsState as dynamic;
      return success.data;
    }
    return currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              // Refresh users list
              context.read<AllUsersBloc>().add(const AllUsersEvent.getAllUsers());
            },
            icon: const Icon(Icons.refresh, color: Colors.white,),
          ),
          const SizedBox(width: 8),
        ],
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu, color: Colors.white,),
          ),
        ),
      ),
      drawer: BlocBuilder<UserDetailsBloc, UserDetailsState>(
        builder: (context, userState) {
          final stateTypeName = userState.runtimeType.toString();
          
          if (stateTypeName.contains('Success')) {
            final success = userState as dynamic;
            final user = success.data;
            return HomeDrawer(
              name: user.name,
              email: user.email,
              imageUrl: 'https://ui-avatars.com/api/?name=${Uri.encodeComponent(user.name)}&background=6366f1&color=fff&size=200',
              onEditProfile: () {},
              onSettings: () {},
              onLogout: () async {
                context.read<LogoutBloc>().add(LogoutEvent.logout());
                NavigationService().goBack();
              },
              onAccount: () {
                NavigationService().navigateTo(RoutingConstants.accountInfoScreen);
              },
            );
          } else if (stateTypeName.contains('Error')) {
            final error = stateTypeName.contains('NetworkError') ? 'Network Error' : 'Error';
            return HomeDrawer(
              name: error,
              email: 'Please try again',
              imageUrl: '',
              onEditProfile: () {},
              onSettings: () {},
              onLogout: () async {
                context.read<LogoutBloc>().add(LogoutEvent.logout());
                NavigationService().goBack();
              },
              onAccount: () {
                NavigationService().navigateTo(RoutingConstants.accountInfoScreen);
              },
            );
          }
          
          // Default loading state
          return HomeDrawer(
            name: 'Loading...',
            email: 'Loading...',
            imageUrl: '',
            onEditProfile: () {},
            onSettings: () {},
            onLogout: () async {
              context.read<LogoutBloc>().add(LogoutEvent.logout());
              NavigationService().goBack();
            },
            onAccount: () {
              NavigationService().navigateTo(RoutingConstants.accountInfoScreen);
            },
          );
        },
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<UserDetailsBloc, UserDetailsState>(
            listener: (context, state) {
              final stateTypeName = state.runtimeType.toString();
              if (stateTypeName.contains('Success')) {
                final success = state as dynamic;
                final user = success.data;
                setState(() {
                  currentUser = user;
                });
                print('Current user updated: ${currentUser?.id}');
              }
            },
          ),
          BlocListener<LogoutBloc, LogoutState>(
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
                  showNetworkSnackBar(context, error, () {
                    context.read<LogoutBloc>().add(LogoutEvent.logout());
                    NavigationService().goBack();
                  });
                },
              );
            },
          ),
          BlocListener<AllUsersBloc, AllUsersState>(
            listener: (context, state) {
              final stateTypeName = state.runtimeType.toString();
              if (stateTypeName.contains('Error')) {
                final errorState = state as dynamic;
                final message = errorState.message ?? 'Unknown error';
                if (stateTypeName.contains('NetworkError')) {
                  showNetworkSnackBar(context, message, () {
                    context.read<AllUsersBloc>().add(const AllUsersEvent.getAllUsers());
                  });
                } else {
                  showErrorSnackBar(context, message);
                }
              }
            },
          ),
        ],
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).primaryColor.withValues(alpha: 0.1),
                Colors.white,
              ],
              stops: const [0.0, 0.3, 1.0],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome to Social Circle!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Select a user to start chatting',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  child: BlocBuilder<AllUsersBloc, AllUsersState>(
                    builder: (context, state) {
                      final stateTypeName = state.runtimeType.toString();
                      
                      if (stateTypeName.contains('Initial')) {
                        return const Center(
                          child: Text('Getting ready...'),
                        );
                      }
                      
                      if (stateTypeName.contains('Loading')) {
                        return const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(),
                              SizedBox(height: 16),
                              Text('Loading users...'),
                            ],
                          ),
                        );
                      }
                      
                      if (stateTypeName.contains('Success')) {
                        final successState = state as dynamic;
                        final users = successState.users as List<UserEntity>;
                        
                        if (users.isEmpty) {
                          return const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.people_outline,
                                  size: 64,
                                  color: Colors.grey,
                                ),
                                SizedBox(height: 16),
                                Text(
                                  'No other users found',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }

                        // Filter out current user from the list
                        final activeUser = _getCurrentUser();
                        final otherUsers = users.where((user) => 
                          activeUser == null || user.id != activeUser.id
                        ).toList();

                        if (otherUsers.isEmpty) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.people_outline,
                                  size: 64,
                                  color: Colors.grey,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  activeUser == null 
                                      ? 'Loading user information...' 
                                      : 'You are the only user',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey,
                                  ),
                                ),
                                if (activeUser != null) ...[
                                  const SizedBox(height: 8),
                                  const Text(
                                    'Invite friends to join Social Circle!',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          );
                        }

                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Users (${otherUsers.length})',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: otherUsers.length,
                                  itemBuilder: (context, index) {
                                    final user = otherUsers[index];
                                    return Card(
                                      margin: const EdgeInsets.only(bottom: 8),
                                      elevation: 2,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: ListTile(
                                        contentPadding: const EdgeInsets.all(16),
                                        leading: CircleAvatar(
                                          radius: 30,
                                          backgroundImage: NetworkImage(
                                            'https://ui-avatars.com/api/?name=${Uri.encodeComponent(user.name)}&background=6366f1&color=fff&size=200',
                                          ),
                                        ),
                                        title: Text(
                                          user.name,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        subtitle: Text(
                                          user.email,
                                          style: const TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        trailing: Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12,
                                            vertical: 6,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Theme.of(context).primaryColor,
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          child: const Text(
                                            'Chat',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          print('Tapped on user: ${user.name}');
                                          
                                          // Get current user
                                          final activeUser = _getCurrentUser();
                                          
                                          print('Current user: ${activeUser?.id}');
                                          print('Mounted: $mounted');
                                          
                                          if (mounted && activeUser != null) {
                                            print('Navigating to chat screen...');
                                            try {
                                              NavigationService().navigateTo(
                                                RoutingConstants.chatScreen,
                                                arguments: {
                                                  'selfId': activeUser.id,
                                                  'peerId': user.id,
                                                  'peerName': user.name,
                                                  'peerImageUrl': 'https://ui-avatars.com/api/?name=${Uri.encodeComponent(user.name)}&background=6366f1&color=fff&size=200',
                                                },
                                              );
                                              print('Navigation call completed');
                                            } catch (e) {
                                              print('Navigation error: $e');
                                            }
                                          } else {
                                            print('Cannot navigate - mounted: $mounted, activeUser: ${activeUser?.id}');
                                            // Trigger user details load if not available
                                            if (activeUser == null) {
                                              context.read<UserDetailsBloc>().add(const UserDetailsEvent.getUserDetails());
                                            }
                                          }
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      
                      if (stateTypeName.contains('Error')) {
                        final errorState = state as dynamic;
                        final message = errorState.message ?? 'Unknown error';
                        final isNetworkError = stateTypeName.contains('NetworkError');
                        
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                isNetworkError ? Icons.wifi_off : Icons.error_outline,
                                size: 64,
                                color: isNetworkError ? Colors.orange : Colors.red,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                '${isNetworkError ? 'Network Error' : 'Error'}: $message',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: isNetworkError ? Colors.orange : Colors.red,
                                ),
                              ),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () {
                                  context.read<AllUsersBloc>().add(const AllUsersEvent.getAllUsers());
                                },
                                child: const Text('Retry'),
                              ),
                            ],
                          ),
                        );
                      }
                      
                      // Default fallback
                      return const Center(
                        child: Text('Unknown state'),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
