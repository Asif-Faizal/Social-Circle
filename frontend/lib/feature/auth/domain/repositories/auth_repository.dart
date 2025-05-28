import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/check_email.entity.dart';
import '../entities/login.entity.dart';
import '../entities/logout.entity.dart';
import '../entities/register.entity.dart';
import '../entities/sent_email_otp.entity.dart';
import '../entities/verify_email_otp.entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, CheckEmailEntity>> checkEmail(String email);
  Future<Either<Failure, LoginEntity>> login({
    required String email,
    required String password,
    required String deviceId,
    required String deviceOs,
  });
  Future<Either<Failure, SentEmailOtpEntity>> sentEmailOtp({
    required String email,
    required String deviceId,
    required String deviceOs,
  });
  Future<Either<Failure, VerifyEmailOtpEntity>> verifyEmailOtp({
    required String email,
    required String otp,
    required String deviceId,
    required String deviceOs,
  });
  Future<Either<Failure, RegisterEntity>> register({
    required String name,
    required String email,
    required String password,
    required String deviceId,
    required String deviceOs,
  });
  Future<Either<Failure, LogoutEntity>> logout({
    required String userId,
    required String deviceId,
  });
}
