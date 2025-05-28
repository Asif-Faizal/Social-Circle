// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sent_email_otp_response.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SentEmailOtpResponseModel _$SentEmailOtpResponseModelFromJson(
  Map<String, dynamic> json,
) => _SentEmailOtpResponseModel(
  success: json['success'] as bool,
  message: json['message'] as String,
);

Map<String, dynamic> _$SentEmailOtpResponseModelToJson(
  _SentEmailOtpResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
};
