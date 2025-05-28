// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logout_response.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LogoutResponseModel _$LogoutResponseModelFromJson(Map<String, dynamic> json) =>
    _LogoutResponseModel(
      success: json['success'] as bool,
      message: json['message'] as String,
    );

Map<String, dynamic> _$LogoutResponseModelToJson(
  _LogoutResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
};
