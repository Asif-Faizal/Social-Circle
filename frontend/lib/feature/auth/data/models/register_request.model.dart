import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_request.model.freezed.dart';
part 'register_request.model.g.dart';


@freezed
abstract class RegisterRequestModel with _$RegisterRequestModel {
  const factory RegisterRequestModel({
    required String email,
    required String password,
    required String deviceId,
    required String deviceOs,
  }) = _RegisterRequestModel;

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestModelFromJson(json);
}
