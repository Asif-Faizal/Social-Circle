import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/verify_email_otp.entity.dart';

part 'verify_email_otp_response.model.freezed.dart';
part 'verify_email_otp_response.model.g.dart';

@freezed
abstract class VerifyEmailOtpResponseModel with _$VerifyEmailOtpResponseModel {
  const factory VerifyEmailOtpResponseModel({
    required bool success,
    required String message,
  }) = _VerifyEmailOtpResponseModel;

  factory VerifyEmailOtpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyEmailOtpResponseModelFromJson(json);

  const VerifyEmailOtpResponseModel._();

  VerifyEmailOtpEntity toEntity() {
    return VerifyEmailOtpEntity(
      success: success,
      message: message,
    );
  }
}
