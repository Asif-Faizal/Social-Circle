import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/logout.entity.dart';

part 'logout_response.model.freezed.dart';
part 'logout_response.model.g.dart';

@freezed
abstract class LogoutResponseModel with _$LogoutResponseModel {
  const factory LogoutResponseModel({
    required bool success,
    required String message,
  }) = _LogoutResponseModel;

  factory LogoutResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LogoutResponseModelFromJson(json);

  const LogoutResponseModel._();

  LogoutEntity toEntity() {
    return LogoutEntity(
      success: success,
      message: message,
    );
  }
} 