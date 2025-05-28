import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_email_otp_event.freezed.dart';

@freezed
abstract class VerifyEmailOtpEvent with _$VerifyEmailOtpEvent {
  const factory VerifyEmailOtpEvent({
    required String email,
    required String otp,
  }) = _VerifyEmailOtpEvent;
}