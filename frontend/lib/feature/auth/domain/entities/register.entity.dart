import 'package:freezed_annotation/freezed_annotation.dart';

part 'register.entity.freezed.dart';

@freezed
abstract class RegisterEntity with _$RegisterEntity {
  const factory RegisterEntity({
    required bool success,
    required String message,
    required String accessToken,
    required String refreshToken,
    required NewUserEntity newUser,
  }) = _RegisterEntity;
}

@freezed
abstract class NewUserEntity with _$NewUserEntity {
  const factory NewUserEntity({
    required String id,
    required String username,
    required String email,
  }) = _NewUserEntity;
} 