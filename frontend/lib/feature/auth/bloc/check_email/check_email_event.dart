import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_email_event.freezed.dart';

@freezed
abstract class CheckEmailEvent with _$CheckEmailEvent {
  const factory CheckEmailEvent.checkEmail(String email) = _CheckEmail;
} 