import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user.entity.dart';
import '../user.repo.dart';

@injectable
class GetAllUsersUseCase implements UseCase<List<UserEntity>, GetAllUsersParams> {
  final UserDetailsRepo userRepository;

  GetAllUsersUseCase(this.userRepository);

  @override
  Future<Either<Failure, List<UserEntity>>> call(GetAllUsersParams params) async {
    return userRepository.getAllUsers(params.deviceId, params.accessToken);
  }
}

class GetAllUsersParams extends Equatable {
  final String deviceId;
  final String accessToken;
  
  const GetAllUsersParams({required this.deviceId, required this.accessToken});
  
  @override
  List<Object?> get props => [deviceId, accessToken];
} 