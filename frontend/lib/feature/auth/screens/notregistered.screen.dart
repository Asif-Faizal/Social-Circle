import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/theme/app_themes.dart';

import '../../../core/routing/routing_arguments.dart';
import '../../../core/routing/routing_contants.dart';
import '../../../core/routing/routing_service.dart';
import '../../../core/widgets/error.snackbar.dart';
import '../../../core/widgets/network.snackbar.dart';
import '../bloc/sent_email_otp/sent_email_otp_bloc.dart';
import '../bloc/sent_email_otp/sent_email_otp_event.dart';
import '../bloc/sent_email_otp/sent_email_otp_state.dart';

class NotRegisteredScreen extends StatelessWidget {
  const NotRegisteredScreen({super.key, required this.args});
  final NotRegisteredArguments args;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: BlocListener<SentEmailOtpBloc, SentEmailOtpState>(
        listener: (context, state) {
          state.maybeWhen(
            success: (data) {
              NavigationService().navigateTo(
                RoutingConstants.enterOtpScreen,
                arguments: EnterOtpArguments(
                  email: args.email,
                  isRegister: true,
                ),
              );
            },
            error: (message) {
              showErrorSnackBar(context, message);
            },
            networkError: (message) {
              showNetworkSnackBar(context, message, () {
                context.read<SentEmailOtpBloc>().add(
                  SentEmailOtpEvent(email: args.email),
                );
              });
            },
            orElse: () {},
          );
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05,
            vertical: size.height * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Continue Registration', style: textTheme.displayLarge),
              RichText(
                text: TextSpan(
                  style: textTheme.bodyLarge,
                  children: [
                    const TextSpan(text: ''),
                    TextSpan(
                      text: args.email,
                      style: textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        color: AppThemes.primaryColor,
                        decorationThickness: 0.5,
                        decorationColor: AppThemes.primaryColor,
                      ),
                    ),
                    const TextSpan(text: ' is not registered'),
                  ],
                ),
              ),
              Text(
                'Please register to with your email and continue with the messaging service',
                style: textTheme.bodyMedium,
              ),
              Spacer(),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    NavigationService().goBack();
                  },
                  child: const Text('Go Back'),
                ),
              ),
              SizedBox(height: size.height * 0.01),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.read<SentEmailOtpBloc>().add(
                      SentEmailOtpEvent(email: args.email),
                    );
                  },
                  child: BlocBuilder<SentEmailOtpBloc, SentEmailOtpState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        loading:
                            () => SizedBox(
                              height: 20,
                              width: 20,
                              child: const CircularProgressIndicator(),
                            ),
                        orElse: () => const Text('Register'),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.01),
            ],
          ),
        ),
      ),
    );
  }
}
