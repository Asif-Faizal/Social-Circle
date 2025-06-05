import 'package:dartz/dartz.dart';
import 'package:frontend/feature/home/data/models/user_request.model.dart';
import 'package:frontend/feature/home/domain/entities/user.entity.dart';
import 'package:frontend/core/error/failures.dart';

import '../domain/user.repo.dart';
class UserRepoImpl extends UserDetailsRepo {
  @override
  Future<Either<Failure, UserEntity>> getUserDetails(UserRequestModel request) {
    // TODO: implement getUserDetails
    throw UnimplementedError();
  }
}
