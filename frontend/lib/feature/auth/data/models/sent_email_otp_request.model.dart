import 'package:freezed_annotation/freezed_annotation.dart';

part 'sent_email_otp_request.model.freezed.dart';
part 'sent_email_otp_request.model.g.dart';

@freezed
abstract class SentEmailOtpRequestModel with _$SentEmailOtpRequestModel {
  const factory SentEmailOtpRequestModel({
    required String email,
  }) = _SentEmailOtpRequestModel;

  factory SentEmailOtpRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SentEmailOtpRequestModelFromJson(json);
} 