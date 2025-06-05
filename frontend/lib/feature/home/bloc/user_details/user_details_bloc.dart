import 'package:bloc/bloc.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/storage/storage_helper.dart';
import '../../domain/usecases/user.details.dart';
import 'user_details_event.dart';
import 'user_details_state.dart';

class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
  final UserDetailsUsecase userDetailsUsecase;
  final StorageHelper storageHelper;
  
  UserDetailsBloc({required this.userDetailsUsecase, required this.storageHelper}) : super(UserDetailsState.initial()) {
    on<UserDetailsEvent>((event, emit) async {
      emit(const UserDetailsState.loading());

      final deviceId = await storageHelper.deviceId;
      final accessToken = await storageHelper.accessToken;

      if (deviceId == null || accessToken == null) {
        emit(const UserDetailsState.error('Device ID or Access Token is null'));
        return;
      }

      final result = await userDetailsUsecase(
        UserDetailsParams(deviceId: deviceId, accessToken: accessToken),
      );

      emit(
        result.fold(
          (failure) {
            if (failure is NetworkFailure) {
              return UserDetailsState.networkError(failure.message);
            }
            return UserDetailsState.error(failure.message);
          },
          (data) => UserDetailsState.success(data),
        ),
      );
    });
  }
}
