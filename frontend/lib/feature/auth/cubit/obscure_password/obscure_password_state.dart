import 'package:freezed_annotation/freezed_annotation.dart';

part 'obscure_password_state.freezed.dart';

@freezed
abstract class ObscurePasswordState with _$ObscurePasswordState {
  const factory ObscurePasswordState.initial() = _Initial;
  const factory ObscurePasswordState.loading() = _Loading;
  const factory ObscurePasswordState.obscurePassword() = _ObscurePassword;
  const factory ObscurePasswordState.showPassword() = _ShowPassword;
  
  const ObscurePasswordState._();
  
  R when<R>({
    required R Function() initial,
    required R Function() loading,
    required R Function() obscurePassword,
    required R Function() showPassword,
    required R Function() orElse,
  }) {
    if (this is _Initial) return initial();
    if (this is _Loading) return loading();
    if (this is _ObscurePassword) return obscurePassword();
    if (this is _ShowPassword) return showPassword();
    throw Exception('Unknown state');
  }
  
  R maybeWhen<R>({
    R Function()? initial,
    R Function()? loading,
    R Function()? obscurePassword,
    R Function()? showPassword,
    required R Function() orElse,
  }) {
    if (this is _Initial && initial != null) return initial();
    if (this is _Loading && loading != null) return loading();
    if (this is _ObscurePassword && obscurePassword != null) return obscurePassword();
    if (this is _ShowPassword && showPassword != null) return showPassword();
    return orElse();
  }
} 