import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/register.entity.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = _Initial;
  const factory RegisterState.loading() = _Loading;
  const factory RegisterState.success(RegisterEntity data) = _Success;
  const factory RegisterState.error(String message) = _Error;
  const factory RegisterState.networkError(String message) = _NetworkError;

  const RegisterState._();

  T maybeWhen<T>({
    T Function()? initial,
    T Function()? loading,
    T Function(RegisterEntity data)? success,
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