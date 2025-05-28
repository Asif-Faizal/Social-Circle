import 'package:freezed_annotation/freezed_annotation.dart';

part 'obscure_password_state.freezed.dart';

@freezed
abstract class ObscurePasswordState with _$ObscurePasswordState {
  const factory ObscurePasswordState({
    @Default(true) bool passwordObscure,
    @Default(true) bool confirmObscure,
  }) = _ObscurePasswordState;
} 