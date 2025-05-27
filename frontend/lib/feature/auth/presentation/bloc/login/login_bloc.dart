import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/storage/storage_helper.dart';
import '../../../domain/usecases/login.usecase.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  final StorageHelper storageHelper;

  LoginBloc({
    required this.loginUseCase,
    required this.storageHelper,
  }) : super(const LoginState.initial()) {
    on<LoginEvent>((event, emit) async {
      emit(const LoginState.loading());

      final deviceId = await storageHelper.deviceId;
      final deviceOs = await storageHelper.deviceOs;

      final result = await loginUseCase(
        LoginParams(
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
              return LoginState.networkError(failure.message);
            }
            return LoginState.error(failure.message);
          },
          (data) {
            if (!data.success || data.accessToken.isEmpty || data.refreshToken.isEmpty || data.user.id.isEmpty) {
              return LoginState.error(data.message);
            }
            storageHelper.setAuthData(isLoggedIn: true, accessToken: data.accessToken, refreshToken: data.refreshToken);
            return LoginState.success(data);
          },
        ),
      );
    });
  }
} 