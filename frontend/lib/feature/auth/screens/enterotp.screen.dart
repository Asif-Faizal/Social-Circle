import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/routing/routing_service.dart';

import '../../../core/di/injection_container.dart';
import '../../../core/routing/routing_arguments.dart';
import '../../../core/routing/routing_contants.dart';
import '../../../core/theme/app_themes.dart';
import '../../../core/widgets/error.snackbar.dart';
import '../../../core/widgets/success.snackbar.dart';
import '../cubit/otp_cubit.dart';
import '../cubit/otp_state.dart';

class EnterOtpScreen extends StatelessWidget {
  const EnterOtpScreen({super.key, required this.args});
  final EnterOtpArguments args;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    // Create a form key to manage the form state
    final formKey = GlobalKey<FormState>();
    
    // Create OTP controllers and focus nodes
    return _OtpInputWidget(
      builder: (controllers, focusNodes) => BlocProvider(
        create: (context) => sl<OtpCubit>(),
        child: Builder(
          builder: (context) {
            return BlocConsumer<OtpCubit, OtpState>(
              listener: (context, state) {
                state.maybeWhen(
                  otpValidationSuccess: () {
                    NavigationService().navigateToReplace(RoutingConstants.enterPasswordScreen, arguments: PasswordArguments(email: args.email, isRegister: args.isRegister));
                  },
                  otpValidationFailure: (message) {
                    // Show error message
                    showErrorSnackBar(context, message ?? 'Invalid OTP');
                  },
                  orElse: () {},
                );
              },
              builder: (context, state) {
                return Scaffold(
                  appBar: AppBar(),
                  body: Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: size.height * 0.05),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Enter OTP', style: textTheme.displayLarge),
                          RichText(
                            text: TextSpan(
                              style: textTheme.bodyLarge,
                              children: [
                                const TextSpan(text: 'Enter the OTP sent to '),
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
                              ],
                            ),
                          ),
                          SizedBox(height: size.height * 0.04),
                          
                          // OTP Fields Row in a Container to maintain fixed height
                          Container(
                            height: 70, // Fixed height container
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(
                                6, 
                                (index) => _buildOtpField(index, context, controllers, focusNodes),
                              ),
                            ),
                          ),

                          // Resend OTP button in a fixed height container
                          Center(
                            child: TextButton(
                              onPressed: () {
                                // Logic to resend OTP
                                showSuccessSnackBar(context, 'OTP resent');
                                // Clear existing OTP
                                for (var i = 0; i < 6; i++) {
                                  controllers[i].clear();
                                }
                                focusNodes[0].requestFocus();
                                context.read<OtpCubit>().clearOtp();
                              },
                              child: const Text('Resend OTP'),
                            ),
                          ),

                          const Spacer(),
                          
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () {
                                  // Validate form before proceeding
                                  if (formKey.currentState!.validate()) {
                                    context.read<OtpCubit>().validateOtp();
                                  } else {
                                    // Show message if not all fields are filled
                                    showErrorSnackBar(context, 'Please enter all OTP digits');
                                  }
                                },
                                child: state.maybeWhen(
                                  loading: () => SizedBox(
                                    width: size.width * 0.05,
                                    height: size.width * 0.05,
                                    child: const CircularProgressIndicator(
                                    ),
                                  ),
                                  orElse: () => const Text('Verify OTP'),
                                ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
  
  // Build individual OTP text field
  Widget _buildOtpField(
    int index, 
    BuildContext context, 
    List<TextEditingController> controllers, 
    List<FocusNode> focusNodes
  ) {
    // OTP validator
    String? validateOtpDigit(String? value) {
      if (value == null || value.isEmpty) {
        return ''; // Return empty string to trigger validation but not show error text
      }
      return null; // Valid
    }
    
    return SizedBox(
      width: 40,
      height: 60, // Fixed height for consistency
      child: TextFormField(
        controller: controllers[index],
        focusNode: focusNodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleLarge,
        validator: validateOtpDigit,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          counterText: '',
          errorStyle: const TextStyle(height: 0), // Hide error text but keep validation
          isDense: true, // Reduces the internal padding
          contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2), // Control the content padding
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppThemes.primaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppThemes.primaryColor, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.red, width: 1),
          ),
        ),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(1),
        ],
        onChanged: (value) {
          if (value.length == 1) {
            // Update cubit with the entered digit
            context.read<OtpCubit>().updateOtpDigit(index, value);
            
            // Move to next field if not the last one
            if (index < 5) {
              FocusScope.of(context).requestFocus(focusNodes[index + 1]);
            } else {
              // Last digit entered, unfocus keyboard
              focusNodes[index].unfocus();
            }
          }
          
          // Handle backspace/delete with empty field to go back
          if (value.isEmpty && index > 0) {
            FocusScope.of(context).requestFocus(focusNodes[index - 1]);
          }
        },
      ),
    );
  }
}

// Helper widget to manage controllers and focus nodes lifecycle
class _OtpInputWidget extends StatefulWidget {
  final Widget Function(List<TextEditingController> controllers, List<FocusNode> focusNodes) builder;
  
  const _OtpInputWidget({required this.builder});
  
  @override
  State<_OtpInputWidget> createState() => _OtpInputWidgetState();
}

class _OtpInputWidgetState extends State<_OtpInputWidget> {
  late final List<TextEditingController> _controllers;
  late final List<FocusNode> _focusNodes;
  
  @override
  void initState() {
    super.initState();
    _controllers = List.generate(6, (_) => TextEditingController());
    _focusNodes = List.generate(6, (_) => FocusNode());
  }
  
  @override
  void dispose() {
    for (var i = 0; i < 6; i++) {
      _controllers[i].dispose();
      _focusNodes[i].dispose();
    }
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return widget.builder(_controllers, _focusNodes);
  }
}
