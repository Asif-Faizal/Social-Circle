import 'package:flutter/material.dart';

import '../../../core/routing/routing_arguments.dart';
import '../../../core/theme/app_themes.dart';
import '../../../core/widgets/error.snackbar.dart';

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

    return Scaffold(
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
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  hintText: '********',
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.password),
                ),
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                validator: validatePassword,
              ),
              if (args.isRegister) ...[
                SizedBox(height: size.height * 0.01),
                TextFormField(
                  controller: confirmPasswordController,
                  decoration: const InputDecoration(
                    hintText: '********',
                    labelText: 'Confirm Password',
                    prefixIcon: Icon(Icons.password),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  validator: validatePassword,
                ),
              ],
              Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      if (args.isRegister) {
                        if (passwordController.text != confirmPasswordController.text) {
                          showErrorSnackBar(context, 'Passwords do not match');
                        } else {
                          // Register
                        }
                      } else {
                        // Login
                      }
                    }
                  },
                  child: args.isRegister ? Text('Register') : Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
