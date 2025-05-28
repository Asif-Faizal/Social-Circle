import 'package:freezed_annotation/freezed_annotation.dart';

part 'sent_email_otp_event.freezed.dart';

@freezed
abstract class SentEmailOtpEvent with _$SentEmailOtpEvent {
  const factory SentEmailOtpEvent({
    required String email,
  }) = _SentEmailOtpEvent;
} 