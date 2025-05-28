// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logout_request.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LogoutRequestModel _$LogoutRequestModelFromJson(Map<String, dynamic> json) =>
    _LogoutRequestModel(
      userId: json['userId'] as String,
      deviceId: json['deviceId'] as String,
      accessToken: json['accessToken'] as String,
    );

Map<String, dynamic> _$LogoutRequestModelToJson(_LogoutRequestModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'deviceId': instance.deviceId,
      'accessToken': instance.accessToken,
    };
