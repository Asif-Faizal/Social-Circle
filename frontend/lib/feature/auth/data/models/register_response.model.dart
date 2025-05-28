import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/register.entity.dart';

part 'register_response.model.freezed.dart';
part 'register_response.model.g.dart';

@freezed
abstract class RegisterResponseModel with _$RegisterResponseModel {
  const factory RegisterResponseModel({
    required bool success,
    required String message,
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'refresh_token') required String refreshToken,
    required UserModel user,
  }) = _RegisterResponseModel;

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseModelFromJson(json);

  const RegisterResponseModel._();

  RegisterEntity toEntity() => RegisterEntity(
        success: success,
        message: message,
        accessToken: accessToken,
        refreshToken: refreshToken,
        user: user.toEntity(),
      );
}

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String username,
    required String email,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  const UserModel._();

  UserEntity toEntity() => UserEntity(
        id: id,
        username: username,
        email: email,
      );
} 