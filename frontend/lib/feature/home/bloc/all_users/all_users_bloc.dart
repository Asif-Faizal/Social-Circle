import 'package:bloc/bloc.dart';
import 'package:frontend/core/error/failures.dart';
import 'package:frontend/core/storage/storage_helper.dart';
import 'package:frontend/feature/home/domain/usecases/get_all_users.usecase.dart';

import 'all_users_event.dart';
import 'all_users_state.dart';

class AllUsersBloc extends Bloc<AllUsersEvent, AllUsersState> {
  final GetAllUsersUseCase getAllUsersUseCase;
  final StorageHelper storageHelper;
  
  AllUsersBloc({
    required this.getAllUsersUseCase,
    required this.storageHelper,
  }) : super(const AllUsersState.initial()) {
    on<AllUsersEvent>((event, emit) async {
      emit(const AllUsersState.loading());

      final deviceId = await storageHelper.deviceId;
      final accessToken = await storageHelper.accessToken;

      if (deviceId == null || accessToken == null) {
        emit(const AllUsersState.error('Device ID or Access Token is null'));
        return;
      }

      final result = await getAllUsersUseCase(
        GetAllUsersParams(deviceId: deviceId, accessToken: accessToken),
      );

      emit(
        result.fold(
          (failure) {
            if (failure is NetworkFailure) {
              return AllUsersState.networkError(failure.message);
            }
            return AllUsersState.error(failure.message);
          },
          (users) => AllUsersState.success(users),
        ),
      );
    });
  }
} 