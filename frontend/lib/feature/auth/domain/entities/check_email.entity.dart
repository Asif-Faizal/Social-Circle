import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_email.entity.freezed.dart';

@freezed
abstract class CheckEmailEntity with _$CheckEmailEntity {
  const factory CheckEmailEntity({
    required bool success,
    required String message,
    required bool isRegistered,
  }) = _CheckEmailEntity;
} 