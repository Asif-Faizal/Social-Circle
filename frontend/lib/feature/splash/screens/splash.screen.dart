import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/routing/routing_contants.dart';
import '../../../core/routing/routing_service.dart';
import '../cubit/splash_cubit.dart';
import '../cubit/splash_state.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return BlocProvider(
      create: (context) {
        final cubit = SplashCubit();
        // Start the timer when the cubit is created
        cubit.startSplashTimer();
        return cubit;
      },
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          state.maybeWhen(
            navigateToNext: () {
              NavigationService().navigateToAndRemoveUntil(RoutingConstants.initialScreen);
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
