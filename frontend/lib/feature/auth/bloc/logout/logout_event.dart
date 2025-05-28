import 'package:freezed_annotation/freezed_annotation.dart';
part 'logout_event.freezed.dart';

@freezed
abstract class LogoutEvent with _$LogoutEvent {
  const factory LogoutEvent.logout() = _Logout;
} 