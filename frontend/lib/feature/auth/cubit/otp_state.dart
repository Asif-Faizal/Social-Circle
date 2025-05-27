import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_state.freezed.dart';

@freezed
abstract class OtpState with _$OtpState {
  const factory OtpState.initial() = _Initial;
  const factory OtpState.loading() = _Loading;
  const factory OtpState.otpEntered({required String otp}) = _OtpEntered;
  const factory OtpState.otpValidationSuccess() = _OtpValidationSuccess;
  const factory OtpState.otpValidationFailure({String? message}) = _OtpValidationFailure;
  
  const OtpState._();
  
  R when<R>({
    required R Function() initial,
    required R Function() loading,
    required R Function(String otp) otpEntered,
    required R Function() otpValidationSuccess,
    required R Function(String? message) otpValidationFailure,
  }) {
    if (this is _Initial) return initial();
    if (this is _Loading) return loading();
    if (this is _OtpEntered) return otpEntered((this as _OtpEntered).otp);
    if (this is _OtpValidationSuccess) return otpValidationSuccess();
    if (this is _OtpValidationFailure) return otpValidationFailure((this as _OtpValidationFailure).message);
    throw Exception('Unknown state');
  }
  
  R maybeWhen<R>({
    R Function()? initial,
    R Function()? loading,
    R Function(String otp)? otpEntered,
    R Function()? otpValidationSuccess,
    R Function(String? message)? otpValidationFailure,
    required R Function() orElse,
  }) {
    if (this is _Initial && initial != null) return initial();
    if (this is _Loading && loading != null) return loading();
    if (this is _OtpEntered && otpEntered != null) return otpEntered((this as _OtpEntered).otp);
    if (this is _OtpValidationSuccess && otpValidationSuccess != null) return otpValidationSuccess();
    if (this is _OtpValidationFailure && otpValidationFailure != null) return otpValidationFailure((this as _OtpValidationFailure).message);
    return orElse();
  }
} 