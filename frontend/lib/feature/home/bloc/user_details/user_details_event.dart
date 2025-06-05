import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_details_event.freezed.dart';

@freezed
abstract class UserDetailsEvent with _$UserDetailsEvent {
  const factory UserDetailsEvent.getUserDetails(String deviceId, String accessToken) = _GetUserDetails;
} 