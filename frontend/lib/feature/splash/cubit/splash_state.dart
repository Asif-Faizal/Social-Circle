import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';

@freezed
abstract class SplashState with _$SplashState {
  const factory SplashState.initial() = _Initial;
  const factory SplashState.navigateToNext() = _NavigateToNext;
  
  const SplashState._();
  
  R when<R>({
    required R Function() initial,
    required R Function() navigateToNext,
  }) {
    if (this is _Initial) return initial();
    if (this is _NavigateToNext) return navigateToNext();
    throw Exception('Unknown state');
  }
  
  R maybeWhen<R>({
    R Function()? initial,
    R Function()? navigateToNext,
    required R Function() orElse,
  }) {
    if (this is _Initial && initial != null) return initial();
    if (this is _NavigateToNext && navigateToNext != null) return navigateToNext();
    return orElse();
  }
} 