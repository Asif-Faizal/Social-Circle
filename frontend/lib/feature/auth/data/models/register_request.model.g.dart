// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RegisterRequestModel _$RegisterRequestModelFromJson(
  Map<String, dynamic> json,
) => _RegisterRequestModel(
  name: json['name'] as String,
  email: json['email'] as String,
  password: json['password'] as String,
  deviceId: json['deviceId'] as String,
  deviceOs: json['deviceOs'] as String,
);

Map<String, dynamic> _$RegisterRequestModelToJson(
  _RegisterRequestModel instance,
) => <String, dynamic>{
  'name': instance.name,
  'email': instance.email,
  'password': instance.password,
  'deviceId': instance.deviceId,
  'deviceOs': instance.deviceOs,
};
