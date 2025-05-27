import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/routing/routing_contants.dart';
import '../../../core/routing/routing_service.dart';
import '../../../core/injection/injection_container.dart';
import '../../../core/storage/storage_helper.dart';
import '../../../core/widgets/error.snackbar.dart';
import '../cubit/splash/splash_cubit.dart';
import '../cubit/splash/splash_state.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    
    return BlocProvider<SplashCubit>(
      create: (_) {
        final cubit = sl<SplashCubit>();
        cubit.initializeApp();
        return cubit;
      },
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          state.maybeWhen(
            navigateToNext: () {
              final storageHelper = sl<StorageHelper>();
              final isLoggedIn = storageHelper.isLoggedIn;
              if (isLoggedIn) {
                NavigationService().navigateToAndRemoveUntil(RoutingConstants.homeScreen);
              } else {
                NavigationService().navigateToAndRemoveUntil(RoutingConstants.initialScreen);
              }
            },
            error: (message) {
              showErrorSnackBar(context, message);
            },
            orElse: () {},
          );
        },
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.4),
                  child: Image.asset('lib/core/asset/chat.png'),
                ),
                SizedBox(height: size.height * 0.005),
                Text(
                  'Social Circle',
                  style: textTheme.labelLarge?.copyWith(
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                BlocBuilder<SplashCubit, SplashState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      loading: () => const CircularProgressIndicator(),
                      orElse: () => const SizedBox(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
