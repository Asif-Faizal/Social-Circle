import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/verify_email_otp.entity.dart';

part 'verify_email_otp_state.freezed.dart';

@freezed
class VerifyEmailOtpState with _$VerifyEmailOtpState {
  const factory VerifyEmailOtpState.initial() = _Initial;
  const factory VerifyEmailOtpState.loading() = _Loading;
  const factory VerifyEmailOtpState.success(VerifyEmailOtpEntity data) = _Success;
  const factory VerifyEmailOtpState.error(String message) = _Error;
  const factory VerifyEmailOtpState.networkError(String message) = _NetworkError;

  const VerifyEmailOtpState._();

  T maybeWhen<T>({
    T Function()? initial,
    T Function()? loading,
    T Function(VerifyEmailOtpEntity data)? success,
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