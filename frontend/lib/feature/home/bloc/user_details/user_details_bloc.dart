import 'package:bloc/bloc.dart';

import '../../../../core/error/failures.dart';
import '../../domain/usecases/user.details.dart';
import 'user_details_event.dart';
import 'user_details_state.dart';

class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
  final UserDetailsUsecase userDetailsUsecase;
  UserDetailsBloc({required this.userDetailsUsecase}) : super(UserDetailsState.initial()) {
    on<UserDetailsEvent>((event, emit) async {
      emit(const UserDetailsState.loading());

      final result = await userDetailsUsecase(
        UserDetailsParams(deviceId: event.deviceId, accessToken: event.accessToken),
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
