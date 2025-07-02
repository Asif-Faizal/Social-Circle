import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/feature/home/domain/entities/user.entity.dart';

part 'all_users_state.freezed.dart';

@freezed
class AllUsersState with _$AllUsersState {
  const factory AllUsersState.initial() = _Initial;
  const factory AllUsersState.loading() = _Loading;
  const factory AllUsersState.success(List<UserEntity> users) = _Success;
  const factory AllUsersState.error(String message) = _Error;
  const factory AllUsersState.networkError(String message) = _NetworkError;
} 