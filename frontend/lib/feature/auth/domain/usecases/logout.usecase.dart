import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/logout.entity.dart';
import '../repositories/auth_repository.dart';

@injectable
class LogoutUsecase implements UseCase<LogoutEntity, LogoutParams> {
  final AuthRepository authRepository;

  LogoutUsecase(this.authRepository);

  @override
  Future<Either<Failure, LogoutEntity>> call(LogoutParams params) async {
    return authRepository.logout(
      userId: params.userId,
      deviceId: params.deviceId,
      accessToken: params.accessToken,
    );
  }
}

class LogoutParams extends Equatable {
  final String userId;
  final String deviceId;
  final String accessToken;
  const LogoutParams({required this.userId, required this.deviceId, required this.accessToken});

  @override
  List<Object?> get props => [userId, deviceId, accessToken];
}
