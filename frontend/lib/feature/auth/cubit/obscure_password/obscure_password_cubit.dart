import 'package:flutter_bloc/flutter_bloc.dart';

import 'obscure_password_state.dart';

class ObscurePasswordCubit extends Cubit<ObscurePasswordState> {
  ObscurePasswordCubit() : super(const ObscurePasswordState());

  /// Toggle visibility for the primary password field.
  void togglePassword() {
    emit(state.copyWith(passwordObscure: !state.passwordObscure));
  }

  /// Toggle visibility for the confirm-password field.
  void toggleConfirm() {
    emit(state.copyWith(confirmObscure: !state.confirmObscure));
  }
}
