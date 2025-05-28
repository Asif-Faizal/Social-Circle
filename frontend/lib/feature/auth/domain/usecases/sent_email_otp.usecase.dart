import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/sent_email_otp.entity.dart';
import '../repositories/auth_repository.dart';

class SentEmailOtpUseCase implements UseCase<SentEmailOtpEntity, SentEmailOtpParams> {
  final AuthRepository repository;

  SentEmailOtpUseCase(this.repository);

  @override
  Future<Either<Failure, SentEmailOtpEntity>> call(SentEmailOtpParams params) async {
    return await repository.sentEmailOtp(params.email);
  }
}

class SentEmailOtpParams extends Equatable {
  final String email;

  const SentEmailOtpParams({required this.email});

  @override
  List<Object> get props => [email];
} 