import 'package:freezed_annotation/freezed_annotation.dart';

part 'sent_email_otp.entity.freezed.dart';

@freezed
abstract class SentEmailOtpEntity with _$SentEmailOtpEntity {
  const factory SentEmailOtpEntity({
    required bool success,
    required String message,
  }) = _SentEmailOtpEntity;
} 