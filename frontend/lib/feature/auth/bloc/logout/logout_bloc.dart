import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/storage/storage_helper.dart';

import '../../../../core/error/failures.dart';
import '../../domain/usecases/logout.usecase.dart';
import 'logout_event.dart';
import 'logout_state.dart';


class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final LogoutUsecase logoutUsecase;
  final StorageHelper storageHelper;

  LogoutBloc({
    required this.logoutUsecase,
    required this.storageHelper,
  }) : super(const LogoutState.initial()) {
    on<LogoutEvent>((event, emit) async {
      emit(const LogoutState.loading());
      final deviceId = storageHelper.deviceId;
      final userId = storageHelper.userId;
      final result = await logoutUsecase(
        LogoutParams(userId: userId ?? '', deviceId: deviceId ?? ''),
      );

      emit(
        result.fold(
          (failure) {
            if (failure is NetworkFailure) {
              return LogoutState.networkError(failure.message);
            }
            return LogoutState.error(failure.message);
          },
          (data) => LogoutState.success(data),
        ),
      );
    });
  }
} 