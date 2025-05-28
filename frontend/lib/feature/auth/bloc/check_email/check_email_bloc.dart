import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/check_email.usecase.dart';
import '../../../../core/error/failures.dart';
import 'check_email_event.dart';
import 'check_email_state.dart';

class CheckEmailBloc extends Bloc<CheckEmailEvent, CheckEmailState> {
  final CheckEmailUseCase checkEmailUseCase;

  CheckEmailBloc({
    required this.checkEmailUseCase,
  }) : super(const CheckEmailState.initial()) {
    on<CheckEmailEvent>((event, emit) async {
      emit(const CheckEmailState.loading());

      final result = await checkEmailUseCase(
        CheckEmailParams(email: event.email),
      );

      emit(
        result.fold(
          (failure) {
            if (failure is NetworkFailure) {
              return CheckEmailState.networkError(failure.message);
            }
            return CheckEmailState.error(failure.message);
          },
          (data) => CheckEmailState.success(data),
        ),
      );
    });
  }
} 