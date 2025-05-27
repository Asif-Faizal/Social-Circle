import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/routing/routing_contants.dart';
import 'package:frontend/core/routing/routing_generator.dart';
import 'package:frontend/core/routing/routing_service.dart';
import 'package:frontend/feature/auth/presentation/bloc/check_email/check_email_bloc.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'core/injection/injection_container.dart';
import 'core/notification/data/firebase_options.dart';
import 'core/storage/storage_helper.dart';
import 'core/theme/app_themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await DependencyInjection.init();
  final storageHelper = sl<StorageHelper>();
  await storageHelper.init();
  
  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CheckEmailBloc>(
          create: (_) => sl<CheckEmailBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Social Circle',
        debugShowCheckedModeBanner: false,
        theme: AppThemes.lightTheme,
        navigatorKey: NavigationService().navigatorKey,
        onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings, context),
        initialRoute: RoutingConstants.splashScreen,
      ),
    );
  }
}