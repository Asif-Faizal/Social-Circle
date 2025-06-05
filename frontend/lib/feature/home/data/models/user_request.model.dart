import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_request.model.freezed.dart';
part 'user_request.model.g.dart';

@freezed
abstract class UserRequestModel with _$UserRequestModel {
  const factory UserRequestModel({
    required String deviceId,
    required String accessToken,
  }) = _UserRequestModel;

  factory UserRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UserRequestModelFromJson(json);
}