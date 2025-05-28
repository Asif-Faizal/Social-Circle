import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/storage/storage_helper.dart';
import '../../domain/usecases/register.usecase.dart';
import 'register_event.dart';
import 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase registerUseCase;
  final StorageHelper storageHelper;

  RegisterBloc({
    required this.registerUseCase,
    required this.storageHelper,
  }) : super(const RegisterState.initial()) {
    on<RegisterEvent>((event, emit) async {
      emit(const RegisterState.loading());

      final deviceId = await storageHelper.deviceId;
      final deviceOs = await storageHelper.deviceOs;

      final name = event.email.split('@')[0];

      final result = await registerUseCase(
        RegisterParams(
          name: name,
          email: event.email,
          password: event.password,
          deviceId: deviceId ?? '',
          deviceOs: deviceOs ?? '',
        ),
      );

      emit(
        result.fold(
          (failure) {
            if (failure is NetworkFailure) {
              return RegisterState.networkError(failure.message);
            }
            return RegisterState.error(failure.message);
          },
          (data) {
            if (!data.success || data.accessToken.isEmpty || data.refreshToken.isEmpty) {
              return RegisterState.error(data.message);
            }
            storageHelper.setAuthData(isLoggedIn: true, accessToken: data.accessToken, refreshToken: data.refreshToken);
            return RegisterState.success(data);
          },
        ),
      );
    });
  }
} 