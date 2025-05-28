import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/verify_email_otp.entity.dart';
import '../repositories/auth_repository.dart';

class VerifyEmailOtpUseCase implements UseCase<VerifyEmailOtpEntity, VerifyEmailOtpParams> {
  final AuthRepository repository;

  VerifyEmailOtpUseCase(this.repository);

  @override
  Future<Either<Failure, VerifyEmailOtpEntity>> call(
      VerifyEmailOtpParams params) async {
    return await repository.verifyEmailOtp(
      email: params.email,
      otp: params.otp,
      deviceId: params.deviceId,
      deviceOs: params.deviceOs,
    );
  }
}

class VerifyEmailOtpParams extends Equatable {
  final String email;
  final String otp;
  final String deviceId;
  final String deviceOs;

  const VerifyEmailOtpParams({
    required this.email,
    required this.otp,
    required this.deviceId,
    required this.deviceOs,
  });

  @override
  List<Object> get props => [email, otp, deviceId, deviceOs];
}
