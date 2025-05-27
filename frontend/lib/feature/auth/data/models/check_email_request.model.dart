import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_email_request.model.freezed.dart';
part 'check_email_request.model.g.dart';

@freezed
abstract class CheckEmailRequestModel with _$CheckEmailRequestModel {
  const factory CheckEmailRequestModel({
    required String email,
  }) = _CheckEmailRequestModel;

  factory CheckEmailRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CheckEmailRequestModelFromJson(json);
} 