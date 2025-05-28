import 'package:freezed_annotation/freezed_annotation.dart';

part 'register.entity.freezed.dart';

@freezed
abstract class RegisterEntity with _$RegisterEntity {
  const factory RegisterEntity({
    required bool success,
    required String message,
    required String accessToken,
    required String refreshToken,
    required UserEntity user,
  }) = _RegisterEntity;
}

@freezed
abstract class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String id,
    required String username,
    required String email,
  }) = _UserEntity;
} 