import 'package:flutter/material.dart';

/// A service that provides navigation functionality throughout the app
class NavigationService {
  static final NavigationService _instance = NavigationService._internal();
  
  factory NavigationService() => _instance;
  
  NavigationService._internal();
  
  /// Global navigation key to access navigator
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  
  /// Get the current navigator state
  NavigatorState get navigator => navigatorKey.currentState!;
  
  /// Navigate to a named route
  Future<dynamic> navigateTo(String routeName, {Object? arguments}) {
    return navigator.pushNamed(routeName, arguments: arguments);
  }
  
  /// Navigate to a named route and remove all previous routes
  Future<dynamic> navigateToAndRemoveUntil(String routeName, {Object? arguments}) {
    return navigator.pushNamedAndRemoveUntil(
      routeName, 
      (Route<dynamic> route) => false,
      arguments: arguments
    );
  }
  
  /// Navigate to a named route and replace the current route
  Future<dynamic> navigateToReplace(String routeName, {Object? arguments}) {
    return navigator.pushReplacementNamed(routeName, arguments: arguments);
  }
  
  /// Go back to the previous route
  void goBack() {
    if (navigator.canPop()) {
      navigator.pop();
    }
  }
  
  /// Go back to the previous route with a result
  void goBackWithResult(dynamic result) {
    if (navigator.canPop()) {
      navigator.pop(result);
    }
  }
  
  /// Go back to a specific route
  void goBackToRoute(String routeName) {
    navigator.popUntil(ModalRoute.withName(routeName));
  }
} 