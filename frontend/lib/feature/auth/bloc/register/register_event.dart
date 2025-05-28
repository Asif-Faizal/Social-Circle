import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_event.freezed.dart';

@freezed
abstract class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent({
    required String email,
    required String password,
  }) = _RegisterEvent;
}