import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:frontend/core/routing/routing_contants.dart';
import 'package:frontend/core/routing/routing_generator.dart';
import 'package:frontend/core/routing/routing_service.dart';
import 'core/notification/data/firebase_options.dart';
import 'core/theme/app_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Circle',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      navigatorKey: NavigationService().navigatorKey,
      onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings, context),
      initialRoute: RoutingConstants.splashScreen,
    );
  }
}