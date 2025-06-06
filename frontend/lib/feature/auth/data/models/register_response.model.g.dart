// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RegisterResponseModel _$RegisterResponseModelFromJson(
  Map<String, dynamic> json,
) => _RegisterResponseModel(
  success: json['success'] as bool,
  message: json['message'] as String,
  accessToken: json['access_token'] as String,
  refreshToken: json['refresh_token'] as String,
  newUser: NewUserModel.fromJson(json['newUser'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RegisterResponseModelToJson(
  _RegisterResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'access_token': instance.accessToken,
  'refresh_token': instance.refreshToken,
  'newUser': instance.newUser,
};

_NewUserModel _$NewUserModelFromJson(Map<String, dynamic> json) =>
    _NewUserModel(
      id: json['id'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$NewUserModelToJson(_NewUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
    };
