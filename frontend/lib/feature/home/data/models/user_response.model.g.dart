// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserResponseModel _$UserResponseModelFromJson(Map<String, dynamic> json) =>
    _UserResponseModel(
      success: json['success'] as bool,
      message: json['message'] as String,
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserResponseModelToJson(_UserResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'user': instance.user,
    };

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'] as String,
  username: json['username'] as String,
  email: json['email'] as String,
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
    };
