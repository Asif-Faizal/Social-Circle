// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginRequestModel _$LoginRequestModelFromJson(Map<String, dynamic> json) =>
    _LoginRequestModel(
      email: json['email'] as String,
      password: json['password'] as String,
      deviceId: json['deviceId'] as String,
      deviceOs: json['deviceOs'] as String,
    );

Map<String, dynamic> _$LoginRequestModelToJson(_LoginRequestModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'deviceId': instance.deviceId,
      'deviceOs': instance.deviceOs,
    };
