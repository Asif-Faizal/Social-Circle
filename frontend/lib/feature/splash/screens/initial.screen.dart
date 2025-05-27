import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/routing/routing_service.dart';
import 'package:frontend/feature/auth/presentation/bloc/check_email/check_email_bloc.dart';
import 'package:frontend/feature/auth/presentation/bloc/check_email/check_email_event.dart';
import 'package:frontend/feature/auth/presentation/bloc/check_email/check_email_state.dart';

import '../../../core/routing/routing_arguments.dart';
import '../../../core/routing/routing_contants.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    final emailController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    String? validateEmail(String? value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your email';
      }

      final emailRegExp = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
      if (!emailRegExp.hasMatch(value)) {
        return 'Please enter a valid email';
      }

      return null;
    }

    return BlocListener<CheckEmailBloc, CheckEmailState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (data) {
            if (data.isRegistered) {
              NavigationService().navigateTo(
                RoutingConstants.enterPasswordScreen,
                arguments: PasswordArguments(
                  email: emailController.text.trim(),
                  isRegister: false,
                ),
              );
            } else {
              NavigationService().navigateTo(
                RoutingConstants.notRegisteredScreen,
                arguments: NotRegisteredArguments(
                  email: emailController.text.trim(),
                ),
              );
            }
          },
          error: (message) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(message)));
          },
          networkError: (message) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(
              SnackBar(
                content: Row(
                  children: [
                    const Icon(Icons.wifi_off, color: Colors.white),
                    const SizedBox(width: 8),
                    Expanded(child: Text(message)),
                  ],
                ),
                backgroundColor: Colors.orange,
                action: SnackBarAction(
                  label: 'Retry',
                  textColor: Colors.white,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context.read<CheckEmailBloc>().add(
                        CheckEmailEvent.checkEmail(
                          emailController.text.trim(),
                        ),
                      );
                    }
                  },
                ),
              ),
            );
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05,
            vertical: size.height * 0.05,
          ),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcome to Social Circle', style: textTheme.displayLarge),
                Text(
                  'Enter your email to continue',
                  style: textTheme.bodyLarge,
                ),
                SizedBox(height: size.height * 0.02),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: 'example@socialcircle.com',
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  validator: validateEmail,
                ),
              ],
            ),
          ),
        ),
                floatingActionButton: BlocBuilder<CheckEmailBloc, CheckEmailState>(
          builder: (context, state) {
            return FloatingActionButton.extended(
              onPressed: state.maybeWhen(
                loading: () => null,
                orElse:
                    () => () {
                      if (formKey.currentState!.validate()) {
                        context.read<CheckEmailBloc>().add(
                          CheckEmailEvent.checkEmail(
                            emailController.text.trim(),
                          ),
                        );
                      }
                    },
              ),
              label: BlocBuilder<CheckEmailBloc, CheckEmailState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loading: () => SizedBox(
                      width: 25,
                      height: 25,
                      child: const CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                    orElse: () => Row(
                      children: const [
                        Text('Continue'),
                        SizedBox(width: 10),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
