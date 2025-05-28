import 'package:flutter_bloc/flutter_bloc.dart';

import 'obscure_password_state.dart';

class ObscurePasswordCubit extends Cubit<ObscurePasswordState> {
  ObscurePasswordCubit() : super(const ObscurePasswordState.obscurePassword());

  /// Toggles the current password visibility state.
  void toggle() {
    state.maybeWhen(
      showPassword: () => emit(const ObscurePasswordState.obscurePassword()),
      obscurePassword: () => emit(const ObscurePasswordState.showPassword()),
      orElse: () => emit(const ObscurePasswordState.showPassword()),
    );
  }
}
