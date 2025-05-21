import 'package:flutter_bloc/flutter_bloc.dart';

import 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(const OtpState.initial());
  
  // Array to store the OTP digits
  final List<String> _otpDigits = List.filled(6, '');

  // Update a specific OTP digit and check if the OTP is complete
  void updateOtpDigit(int index, String value) {
    if (index >= 0 && index < 6) {
      _otpDigits[index] = value;
      
      // Check if all digits are filled
      final isComplete = _otpDigits.every((digit) => digit.isNotEmpty);
      
      if (isComplete) {
        final fullOtp = _otpDigits.join();
        emit(OtpState.otpEntered(otp: fullOtp));
      }
    }
  }
  
  // Clear all OTP digits
  void clearOtp() {
    for (var i = 0; i < _otpDigits.length; i++) {
      _otpDigits[i] = '';
    }
    emit(const OtpState.initial());
  }
  
  // Validate the entered OTP
  Future<void> validateOtp() async {
    emit(const OtpState.loading());
    
    try {
      // Here you would normally make an API call to validate the OTP
      // For demonstration purposes, let's just simulate a successful validation
      await Future.delayed(const Duration(seconds: 1));
      
      // Check if OTP is correct (for demo, assume 123456 is correct)
      final enteredOtp = _otpDigits.join();
      
      if (enteredOtp == '123456') {
        emit(const OtpState.otpValidationSuccess());
      } else {
        emit(const OtpState.otpValidationFailure(message: 'Invalid OTP'));
      }
    } catch (e) {
      emit(OtpState.otpValidationFailure(message: e.toString()));
    }
  }
} 