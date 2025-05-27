import 'package:freezed_annotation/freezed_annotation.dart';

part 'login.entity.freezed.dart';

@freezed
abstract class LoginEntity with _$LoginEntity {
  const factory LoginEntity({
    required bool success,
    required String message,
    required String accessToken,
    required String refreshToken,
    required UserEntity user,
  }) = _LoginEntity;
}

@freezed
abstract class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String id,
    required String username,
    required String email,
  }) = _UserEntity;
} 