import 'package:dartz/dartz.dart';
import 'package:frontend/feature/home/data/models/user_request.model.dart';
import 'package:frontend/feature/home/domain/entities/user.entity.dart';
import 'package:frontend/core/error/failures.dart';

import '../domain/user.repo.dart';
import 'user.datasource.dart';

class UserRepoImpl extends UserDetailsRepo {
  final UserDataSource userDataSource;
  UserRepoImpl({required this.userDataSource});
  
  @override
  Future<Either<Failure, UserEntity>> getUserDetails(UserRequestModel request) async {
    try {
      final result = await userDataSource.getUserDetails(request);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<UserEntity>>> getAllUsers(String deviceId, String accessToken) async {
    try {
      final result = await userDataSource.getAllUsers(deviceId, accessToken);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
