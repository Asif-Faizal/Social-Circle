import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_users_event.freezed.dart';

@freezed
class AllUsersEvent with _$AllUsersEvent {
  const factory AllUsersEvent.getAllUsers() = _GetAllUsers;
} 