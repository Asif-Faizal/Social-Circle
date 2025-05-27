import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/login.entity.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.success(LoginEntity data) = _Success;
  const factory LoginState.error(String message) = _Error;
  const factory LoginState.networkError(String message) = _NetworkError;

  const LoginState._();

  T maybeWhen<T>({
    T Function()? initial,
    T Function()? loading,
    T Function(LoginEntity data)? success,
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