import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_request.model.freezed.dart';
part 'login_request.model.g.dart';

@freezed
abstract class LoginRequestModel with _$LoginRequestModel {
  const factory LoginRequestModel({
    required String email,
    required String password,
    required String deviceId,
    required String deviceOs,
  }) = _LoginRequestModel;

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestModelFromJson(json);
} 