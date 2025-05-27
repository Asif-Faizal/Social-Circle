import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/check_email.entity.dart';
import '../entities/login.entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, CheckEmailEntity>> checkEmail(String email);
  Future<Either<Failure, LoginEntity>> login({
    required String email,
    required String password,
    required String deviceId,
    required String deviceOs,
  });
} 