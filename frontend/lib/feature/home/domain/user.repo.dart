import 'package:dartz/dartz.dart';
import 'package:frontend/feature/home/data/models/user_request.model.dart';
import 'package:frontend/feature/home/domain/entities/user.entity.dart';

import '../../../core/error/failures.dart';
abstract class UserDetailsRepo {
  Future<Either<Failure, UserEntity>> getUserDetails(UserRequestModel request);
}
