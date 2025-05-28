import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_email_otp_request.model.freezed.dart';
part 'verify_email_otp_request.model.g.dart';

@freezed
abstract class VerifyEmailOtpRequestModel with _$VerifyEmailOtpRequestModel {
  const factory VerifyEmailOtpRequestModel({
    required String email,
    required String otp,
    required String deviceId,
    required String deviceOs,
  }) = _VerifyEmailOtpRequestModel;

  factory VerifyEmailOtpRequestModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyEmailOtpRequestModelFromJson(json);
}
