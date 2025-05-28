import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/sent_email_otp.entity.dart';

part 'sent_email_otp_response.model.freezed.dart';
part 'sent_email_otp_response.model.g.dart';

@freezed
abstract class SentEmailOtpResponseModel with _$SentEmailOtpResponseModel {
  const factory SentEmailOtpResponseModel({
    required bool success,
    required String message,
  }) = _SentEmailOtpResponseModel;

  factory SentEmailOtpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SentEmailOtpResponseModelFromJson(json);

  const SentEmailOtpResponseModel._();

  SentEmailOtpEntity toEntity() {
    return SentEmailOtpEntity(
      success: success,
      message: message,
    );
  }
} 