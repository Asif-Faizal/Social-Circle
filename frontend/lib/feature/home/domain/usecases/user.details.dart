import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/user_request.model.dart';
import '../entities/user.entity.dart';
import '../user.repo.dart';

@injectable
class UserDetailsUsecase implements UseCase<UserEntity, UserDetailsParams> {
  final UserDetailsRepo userRepository;

  UserDetailsUsecase(this.userRepository);

  @override
  Future<Either<Failure, UserEntity>> call(UserDetailsParams params) async {
    return userRepository.getUserDetails(
      UserRequestModel(
        deviceId: params.deviceId,
        accessToken: params.accessToken,
      ),
    );
  }
}

class UserDetailsParams extends Equatable {
  final String deviceId;
  final String accessToken;
  const UserDetailsParams({required this.deviceId, required this.accessToken});
  @override
  List<Object?> get props => [deviceId, accessToken];
}
