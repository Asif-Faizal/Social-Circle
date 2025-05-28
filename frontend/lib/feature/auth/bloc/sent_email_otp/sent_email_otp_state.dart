import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/sent_email_otp.entity.dart';

part 'sent_email_otp_state.freezed.dart';

@freezed
class SentEmailOtpState with _$SentEmailOtpState {
  const factory SentEmailOtpState.initial() = _Initial;
  const factory SentEmailOtpState.loading() = _Loading;
  const factory SentEmailOtpState.success(SentEmailOtpEntity data) = _Success;
  const factory SentEmailOtpState.error(String message) = _Error;
  const factory SentEmailOtpState.networkError(String message) = _NetworkError;

  const SentEmailOtpState._();

  T maybeWhen<T>({
    T Function()? initial,
    T Function()? loading,
    T Function(SentEmailOtpEntity data)? success,
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