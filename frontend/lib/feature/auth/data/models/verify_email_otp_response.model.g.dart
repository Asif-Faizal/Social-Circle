// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_email_otp_response.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VerifyEmailOtpResponseModel _$VerifyEmailOtpResponseModelFromJson(
  Map<String, dynamic> json,
) => _VerifyEmailOtpResponseModel(
  success: json['success'] as bool,
  message: json['message'] as String,
);

Map<String, dynamic> _$VerifyEmailOtpResponseModelToJson(
  _VerifyEmailOtpResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
};
