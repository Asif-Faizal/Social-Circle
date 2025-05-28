import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'verify_email_otp_event.dart';
part 'verify_email_otp_state.dart';

class VerifyEmailOtpBloc extends Bloc<VerifyEmailOtpEvent, VerifyEmailOtpState> {
  VerifyEmailOtpBloc() : super(VerifyEmailOtpInitial()) {
    on<VerifyEmailOtpEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
