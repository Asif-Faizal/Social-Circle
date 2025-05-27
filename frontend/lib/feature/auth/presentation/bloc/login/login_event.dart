import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_event.freezed.dart';

@freezed
abstract class LoginEvent with _$LoginEvent {
  const factory LoginEvent({
    required String email,
    required String password,
  }) = _LoginEvent;
} 