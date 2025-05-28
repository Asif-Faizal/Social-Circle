// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_email_otp_request.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VerifyEmailOtpRequestModel _$VerifyEmailOtpRequestModelFromJson(
  Map<String, dynamic> json,
) => _VerifyEmailOtpRequestModel(
  email: json['email'] as String,
  otp: json['otp'] as String,
  deviceId: json['deviceId'] as String,
  deviceOs: json['deviceOs'] as String,
);

Map<String, dynamic> _$VerifyEmailOtpRequestModelToJson(
  _VerifyEmailOtpRequestModel instance,
) => <String, dynamic>{
  'email': instance.email,
  'otp': instance.otp,
  'deviceId': instance.deviceId,
  'deviceOs': instance.deviceOs,
};
