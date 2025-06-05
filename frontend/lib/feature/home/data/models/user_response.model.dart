import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user.entity.dart';

part 'user_response.model.freezed.dart';
part 'user_response.model.g.dart';

@freezed
abstract class UserResponseModel with _$UserResponseModel {
  const factory UserResponseModel({
    required bool success,
    required String message,
    required UserModel user,
  }) = _UserResponseModel;

  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserResponseModelFromJson(json);

  const UserResponseModel._();

  UserEntity toEntity() => UserEntity(
        success: success,
        message: message,
        id: user.id,
        name: user.username,
        email: user.email,
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
}
