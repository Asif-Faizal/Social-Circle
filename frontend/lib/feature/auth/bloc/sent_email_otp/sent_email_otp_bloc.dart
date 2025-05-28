import 'package:bloc/bloc.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/storage/storage_helper.dart';
import '../../domain/usecases/sent_email_otp.usecase.dart';
import 'sent_email_otp_event.dart';
import 'sent_email_otp_state.dart';

class SentEmailOtpBloc extends Bloc<SentEmailOtpEvent, SentEmailOtpState> {
  final SentEmailOtpUseCase sentEmailOtpUseCase;
  final StorageHelper storageHelper;

  SentEmailOtpBloc({
    required this.sentEmailOtpUseCase,
    required this.storageHelper,
  }) : super(const SentEmailOtpState.initial()) {
    on<SentEmailOtpEvent>((event, emit) async {
      emit(const SentEmailOtpState.loading());

      final deviceId = await storageHelper.deviceId;
      final deviceOs = await storageHelper.deviceOs;

      final result = await sentEmailOtpUseCase(
        SentEmailOtpParams(
          email: event.email,
          deviceId: deviceId ?? '',
          deviceOs: deviceOs ?? '',
        ),
      );

      emit(
        result.fold(
          (failure) {
            if (failure is NetworkFailure) {
              return SentEmailOtpState.networkError(failure.message);
            }
            return SentEmailOtpState.error(failure.message);
          },
          (data) => SentEmailOtpState.success(data),
        ),
      );
    });
  }
} 