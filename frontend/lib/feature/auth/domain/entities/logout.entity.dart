import 'package:freezed_annotation/freezed_annotation.dart';

part 'logout.entity.freezed.dart';

@freezed
abstract class LogoutEntity with _$LogoutEntity {
  const factory LogoutEntity({
    required bool success,
    required String message,
  }) = _LogoutEntity;
} 