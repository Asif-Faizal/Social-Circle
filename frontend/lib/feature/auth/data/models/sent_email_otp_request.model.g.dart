// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sent_email_otp_request.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SentEmailOtpRequestModel _$SentEmailOtpRequestModelFromJson(
  Map<String, dynamic> json,
) => _SentEmailOtpRequestModel(
  email: json['email'] as String,
  deviceId: json['deviceId'] as String,
  deviceOs: json['deviceOs'] as String,
);

Map<String, dynamic> _$SentEmailOtpRequestModelToJson(
  _SentEmailOtpRequestModel instance,
) => <String, dynamic>{
  'email': instance.email,
  'deviceId': instance.deviceId,
  'deviceOs': instance.deviceOs,
};
