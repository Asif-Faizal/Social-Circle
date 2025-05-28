import 'package:bloc/bloc.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/storage/storage_helper.dart';
import '../../domain/usecases/verify_email_otp.usecase.dart';
import 'verify_email_otp_event.dart';
import 'verify_email_otp_state.dart';

class VerifyEmailOtpBloc extends Bloc<VerifyEmailOtpEvent, VerifyEmailOtpState> {
  final VerifyEmailOtpUseCase verifyEmailOtpUseCase;
  final StorageHelper storageHelper;

  VerifyEmailOtpBloc({
    required this.verifyEmailOtpUseCase,
    required this.storageHelper,
  }) : super(const VerifyEmailOtpState.initial()){
    on<VerifyEmailOtpEvent>((event, emit) async {
      emit(const VerifyEmailOtpState.loading());

      final deviceId = await storageHelper.deviceId;
      final deviceOs = await storageHelper.deviceOs;

      final result = await verifyEmailOtpUseCase(
        VerifyEmailOtpParams(
          email: event.email,
          otp: event.otp,
          deviceId: deviceId ?? '',
          deviceOs: deviceOs ?? '',
        ),
      );

      emit(
        result.fold(
          (failure) {
            if (failure is NetworkFailure) {
              return VerifyEmailOtpState.networkError(failure.message);
            }
            return VerifyEmailOtpState.error(failure.message);
          },
          (data) => VerifyEmailOtpState.success(data),
        ),
      );
    });
  }  
}
