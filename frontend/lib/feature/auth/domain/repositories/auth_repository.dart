import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/check_email.entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, CheckEmailEntity>> checkEmail(String email);
} 