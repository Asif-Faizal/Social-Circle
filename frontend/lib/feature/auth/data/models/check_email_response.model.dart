import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/check_email.entity.dart';

part 'check_email_response.model.freezed.dart';
part 'check_email_response.model.g.dart';

@freezed
abstract class CheckEmailResponseModel with _$CheckEmailResponseModel {
  const factory CheckEmailResponseModel({
    required bool success,
    required String message,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'is_registered') required bool isRegistered,
  }) = _CheckEmailResponseModel;

  factory CheckEmailResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CheckEmailResponseModelFromJson(json);

  const CheckEmailResponseModel._();

  CheckEmailEntity toEntity() {
    return CheckEmailEntity(
      success: success,
      message: message,
      isRegistered: isRegistered,
    );
  }
} 