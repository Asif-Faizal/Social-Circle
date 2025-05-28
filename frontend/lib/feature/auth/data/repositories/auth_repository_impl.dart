import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/check_email.entity.dart';
import '../../domain/entities/login.entity.dart';
import '../../domain/entities/sent_email_otp.entity.dart';
import '../../domain/entities/verify_email_otp.entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/login_request.model.dart';
import '../models/sent_email_otp_request.model.dart';
import '../models/verify_email_otp_request.model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, CheckEmailEntity>> checkEmail(String email) async {
    try {
      final result = await remoteDataSource.checkEmail(email);
      return Right(result.toEntity());
    } on NetworkFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, LoginEntity>> login({
    required String email,
    required String password,
    required String deviceId,
    required String deviceOs,
  }) async {
    try {
      final request = LoginRequestModel(
        email: email,
        password: password,
        deviceId: deviceId,
        deviceOs: deviceOs,
      );
      final result = await remoteDataSource.login(request);
      if (result.success == false) {
        return Left(ServerFailure(result.message));
      } else {
        return Right(result.toEntity());
      }
    } on NetworkFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SentEmailOtpEntity>> sentEmailOtp({
    required String email,
    required String deviceId,
    required String deviceOs,
  }) async {
    try {
      final request = SentEmailOtpRequestModel(
        email: email,
        deviceId: deviceId,
        deviceOs: deviceOs,
      );
      final result = await remoteDataSource.sentEmailOtp(request);
      if (result.success == false) {
        return Left(ServerFailure(result.message));
      } else {
        return Right(result.toEntity());
      }
    } on NetworkFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, VerifyEmailOtpEntity>> verifyEmailOtp({
    required String email,
    required String otp,
    required String deviceId,
    required String deviceOs,
  }) async {
    try {
      final request = VerifyEmailOtpRequestModel(
        email: email,
        otp: otp,
        deviceId: deviceId,
        deviceOs: deviceOs,
      );
      final result = await remoteDataSource.verifyEmailOtp(request);
      if (result.success == false) {
        return Left(ServerFailure(result.message));
      } else {
        return Right(result.toEntity());
      }
    } on NetworkFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
