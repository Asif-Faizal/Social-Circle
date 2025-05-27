import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/check_email.entity.dart';

part 'check_email_state.freezed.dart';

@freezed
class CheckEmailState with _$CheckEmailState {
  const factory CheckEmailState.initial() = _Initial;
  const factory CheckEmailState.loading() = _Loading;
  const factory CheckEmailState.success(CheckEmailEntity data) = _Success;
  const factory CheckEmailState.error(String message) = _Error;

  const CheckEmailState._();

  T maybeWhen<T>({
    T Function()? initial,
    T Function()? loading,
    T Function(CheckEmailEntity data)? success,
    T Function(String message)? error,
    required T Function() orElse,
  }) {
    final v = this;
    if (v is _Initial && initial != null) return initial();
    if (v is _Loading && loading != null) return loading();
    if (v is _Success && success != null) return success((v).data);
    if (v is _Error && error != null) return error((v).message);
    return orElse();
  }
} 