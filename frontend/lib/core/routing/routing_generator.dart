import 'package:flutter/material.dart';

import '../../feature/auth/screens/enterotp.screen.dart';
import '../../feature/auth/screens/password.screen.dart';
import '../../feature/home/screens/account_info.screen.dart';
import '../../feature/home/screens/home.screen.dart';
import '../../feature/splash/screens/initial.screen.dart';
import '../../feature/splash/screens/splash.screen.dart';
import '../../feature/auth/screens/notregistered.screen.dart';
import '../../feature/chat/screens/chat_screen.dart';
import 'routing_arguments.dart';
import 'routing_contants.dart';

class RouteGenerator {
  /// Route generation method that returns the appropriate route
  static Route<dynamic> generateRoute(RouteSettings settings, BuildContext context) {
    // Get arguments passed to the route
    final args = settings.arguments;

    switch (settings.name) {
      case RoutingConstants.splashScreen:
        return _buildRoute(const SplashScreen(), settings);
      case RoutingConstants.initialScreen:
        return _buildRoute(const InitialScreen(), settings);
      case RoutingConstants.notRegisteredScreen:
        return _buildRoute(NotRegisteredScreen(args: args as NotRegisteredArguments), settings);
      case RoutingConstants.enterOtpScreen:
        return _buildRoute(EnterOtpScreen(args: args as EnterOtpArguments), settings);
      case RoutingConstants.enterPasswordScreen:
        return _buildRoute(PasswordScreen(args: args as PasswordArguments), settings);
      case RoutingConstants.homeScreen:
        return _buildRoute(const HomeScreen(), settings);
      case RoutingConstants.accountInfoScreen:
        return _buildRoute(const AccountInfoScreen(), settings);
      case RoutingConstants.chatScreen:
        final chatArgs = settings.arguments as Map<String, dynamic>?;
        if (chatArgs == null) {
          print('Error: No arguments provided for chat screen');
          return _errorRoute('Missing chat arguments', context);
        }
        print('Chat screen arguments: $chatArgs');
        return _buildRoute(ChatScreen(
          selfId: chatArgs['selfId'],
          peerId: chatArgs['peerId'],
          peerName: chatArgs['peerName'],
          peerImageUrl: chatArgs['peerImageUrl'],
        ), settings);
      default:
        return _errorRoute('No route found', context);
    }
  }

  /// Helper method to create a route
  static Route<dynamic> _buildRoute(Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeOutQuint;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }

  /// Helper method to create an error route
  static Route<dynamic> _errorRoute(String message, BuildContext context) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              message,
              style: const TextStyle(color: Colors.red),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}