// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_email_response.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CheckEmailResponseModel _$CheckEmailResponseModelFromJson(
  Map<String, dynamic> json,
) => _CheckEmailResponseModel(
  success: json['success'] as bool,
  message: json['message'] as String,
  isRegistered: json['is_registered'] as bool,
);

Map<String, dynamic> _$CheckEmailResponseModelToJson(
  _CheckEmailResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'is_registered': instance.isRegistered,
};
