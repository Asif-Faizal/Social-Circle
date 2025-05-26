import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.initial() = _Initial;
  const factory SplashState.loading() = _Loading;
  const factory SplashState.navigateToNext() = _NavigateToNext;
  const factory SplashState.error(String message) = _Error;

  const SplashState._();

  T maybeWhen<T>({
    T Function()? initial,
    T Function()? loading,
    T Function()? navigateToNext,
    T Function(String message)? error,
    required T Function() orElse,
  }) {
    final v = this;
    if (v is _Initial && initial != null) return initial();
    if (v is _Loading && loading != null) return loading();
    if (v is _NavigateToNext && navigateToNext != null) return navigateToNext();
    if (v is _Error && error != null) return error((v).message);
    return orElse();
  }
} 