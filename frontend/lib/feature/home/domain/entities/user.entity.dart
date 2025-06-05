import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.entity.freezed.dart';

@freezed
abstract class UserEntity with _$UserEntity {
  const factory UserEntity({
    required bool success,
    required String message,
    required String id,
    required String name,
    required String email,
  }) = _UserEntity;
}