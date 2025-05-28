import 'package:freezed_annotation/freezed_annotation.dart';

part 'logout_request.model.freezed.dart';
part 'logout_request.model.g.dart';

@freezed
abstract class LogoutRequestModel with _$LogoutRequestModel {
  const factory LogoutRequestModel({
    required String userId,
    required String deviceId,
  }) = _LogoutRequestModel;

  factory LogoutRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LogoutRequestModelFromJson(json);
}