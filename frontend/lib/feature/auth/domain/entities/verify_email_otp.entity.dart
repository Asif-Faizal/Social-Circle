import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_email_otp.entity.freezed.dart';

@freezed
abstract class VerifyEmailOtpEntity with _$VerifyEmailOtpEntity {
  const factory VerifyEmailOtpEntity({
    required bool success,
    required String message,
  }) = _VerifyEmailOtpEntity;
}
