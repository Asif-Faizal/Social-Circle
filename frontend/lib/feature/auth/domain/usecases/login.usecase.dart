import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/login.entity.dart';
import '../repositories/auth_repository.dart';

@injectable
class LoginUseCase implements UseCase<LoginEntity, LoginParams> {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<Either<Failure, LoginEntity>> call(LoginParams params) {
    return repository.login(
      email: params.email,
      password: params.password,
      deviceId: params.deviceId,
      deviceOs: params.deviceOs,
    );
  }
}

class LoginParams {
  final String email;
  final String password;
  final String deviceId;
  final String deviceOs;

  const LoginParams({
    required this.email,
    required this.password,
    required this.deviceId,
    required this.deviceOs,
  });
} 