import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/routing/routing_arguments.dart';
import '../../../core/routing/routing_contants.dart';
import '../../../core/routing/routing_service.dart';
import '../../../core/theme/app_themes.dart';
import '../../../core/widgets/error.snackbar.dart';
import '../../../core/widgets/network.snackbar.dart';
import '../bloc/login/login_bloc.dart';
import '../bloc/login/login_event.dart';
import '../bloc/login/login_state.dart';
import '../bloc/register/register_bloc.dart';
import '../bloc/register/register_event.dart';
import '../bloc/register/register_state.dart';
import '../cubit/obscure_password/obscure_password_cubit.dart';
import '../cubit/obscure_password/obscure_password_state.dart';

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({super.key, required this.args});
  final PasswordArguments args;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    // Email validation function
    String? validatePassword(String? value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your password';
      }

      final passwordRegExp = RegExp(r'^[a-zA-Z0-9]+$');
      if (!passwordRegExp.hasMatch(value)) {
        return 'Please enter a valid password';
      }

      return null; // Return null if validation passes
    }

    return BlocProvider(
      create: (_) => ObscurePasswordCubit(),
      child: Scaffold(
        appBar: AppBar(),
        body: MultiBlocListener(
          listeners: [
            BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                state.maybeWhen(
                  success: (data) {
                    NavigationService().navigateToAndRemoveUntil(
                      RoutingConstants.homeScreen,
                    );
                  },
                  error: (message) {
                    showErrorSnackBar(context, message);
                  },
                  networkError: (message) {
                    showNetworkSnackBar(context, message, () {
                      if (formKey.currentState!.validate()) {
                        context.read<LoginBloc>().add(
                          LoginEvent(
                            email: args.email,
                            password: passwordController.text,
                          ),
                        );
                      }
                    });
                  },
                  orElse: () {},
                );
              },
            ),
            BlocListener<RegisterBloc, RegisterState>(
              listener: (context, state) {
                state.maybeWhen(
                  success: (data) {
                    NavigationService().navigateToAndRemoveUntil(
                      RoutingConstants.homeScreen,
                    );
                  },
                  error: (message) {
                    showErrorSnackBar(context, message);
                  },
                  networkError: (message) {
                    showNetworkSnackBar(context, message, () {});
                  },
                  orElse: () {},
                );
              },
            ),
          ],
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.05,
              vertical: size.height * 0.05,
            ),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    args.isRegister ? 'Create Password' : 'Enter Password',
                    style: textTheme.displayLarge,
                  ),
                  RichText(
                    text: TextSpan(
                      style: textTheme.bodyLarge,
                      children: [
                        TextSpan(
                          text:
                              args.isRegister
                                  ? 'Create a password for '
                                  : 'Enter the password for ',
                          style: textTheme.bodyLarge,
                        ),
                        TextSpan(
                          text: args.email,
                          style: textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            color: AppThemes.primaryColor,
                            decorationThickness: 0.5,
                            decorationColor: AppThemes.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  BlocBuilder<ObscurePasswordCubit, ObscurePasswordState>(
                    builder: (context, state) {
                      final isObscure = state.passwordObscure;
                      return TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          hintText: '********',
                          labelText: 'Password',
                          prefixIcon: const Icon(Icons.password),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed:
                                () =>
                                    context
                                        .read<ObscurePasswordCubit>()
                                        .togglePassword(),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        autocorrect: false,
                        obscureText: isObscure,
                        validator: validatePassword,
                      );
                    },
                  ),
                  if (args.isRegister) ...[
                    SizedBox(height: size.height * 0.01),
                    BlocBuilder<ObscurePasswordCubit, ObscurePasswordState>(
                      builder: (context, state) {
                        final isObscure = state.confirmObscure;
                        return TextFormField(
                          controller: confirmPasswordController,
                          decoration: InputDecoration(
                            hintText: '********',
                            labelText: 'Confirm Password',
                            prefixIcon: const Icon(Icons.password),
                            suffixIcon: IconButton(
                              icon: Icon(
                                isObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed:
                                  () =>
                                      context
                                          .read<ObscurePasswordCubit>()
                                          .toggleConfirm(),
                            ),
                          ),
                          keyboardType: TextInputType.text,
                          autocorrect: false,
                          obscureText: isObscure,
                          validator: validatePassword,
                        );
                      },
                    ),
                  ],
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          if (args.isRegister) {
                            if (passwordController.text !=
                                confirmPasswordController.text) {
                              showErrorSnackBar(
                                context,
                                'Passwords do not match',
                              );
                            } else {
                              context.read<RegisterBloc>().add(
                                RegisterEvent(
                                  email: args.email,
                                  password: passwordController.text,
                                ),
                              );
                            }
                          } else {
                            context.read<LoginBloc>().add(
                              LoginEvent(
                                email: args.email,
                                password: passwordController.text,
                              ),
                            );
                          }
                        }
                      },
                      child:
                          args.isRegister
                              ? BlocBuilder<RegisterBloc, RegisterState>(
                                builder: (context, state) {
                                  return state.maybeWhen(
                                    loading:
                                        () => const SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                          ),
                                        ),
                                    orElse: () => const Text('Register'),
                                  );
                                },
                              )
                              : BlocBuilder<LoginBloc, LoginState>(
                                builder: (context, state) {
                                  return state.maybeWhen(
                                    loading:
                                        () => const SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                          ),
                                        ),
                                    orElse: () => const Text('Login'),
                                  );
                                },
                              ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
