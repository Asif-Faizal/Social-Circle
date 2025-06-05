import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user.entity.dart';

part 'user_details_state.freezed.dart';

@freezed
class UserDetailsState with _$UserDetailsState {
  const factory UserDetailsState.initial() = _Initial;
  const factory UserDetailsState.loading() = _Loading;
  const factory UserDetailsState.success(UserEntity data) = _Success;
  const factory UserDetailsState.error(String message) = _Error;
  const factory UserDetailsState.networkError(String message) = _NetworkError;

  const UserDetailsState._();

  T maybeWhen<T>({
    T Function()? initial,
    T Function()? loading,
    T Function(UserEntity data)? success,
    T Function(String message)? error,
    T Function(String message)? networkError,
    required T Function() orElse,
  }) {
    final v = this;
    if (v is _Initial && initial != null) return initial();
    if (v is _Loading && loading != null) return loading();
    if (v is _Success && success != null) return success((v).data);
    if (v is _Error && error != null) return error((v).message);
    if (v is _NetworkError && networkError != null) return networkError((v).message);
    return orElse();
  }
} 