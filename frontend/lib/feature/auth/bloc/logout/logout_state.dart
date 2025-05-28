import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/logout.entity.dart';

part 'logout_state.freezed.dart';

@freezed
class LogoutState with _$LogoutState {
  const factory LogoutState.initial() = _Initial;
  const factory LogoutState.loading() = _Loading;
  const factory LogoutState.success(LogoutEntity data) = _Success;
  const factory LogoutState.error(String message) = _Error;
  const factory LogoutState.networkError(String message) = _NetworkError;

  const LogoutState._();

  T maybeWhen<T>({
    T Function()? initial,
    T Function()? loading,
    T Function(LogoutEntity data)? success,
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