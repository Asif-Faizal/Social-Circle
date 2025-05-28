import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/register.entity.dart';
import '../repositories/auth_repository.dart';

@injectable
class RegisterUseCase implements UseCase<RegisterEntity, RegisterParams> {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<Either<Failure, RegisterEntity>> call(RegisterParams params) {
    return repository.register(
      name: params.name,
      email: params.email,
      password: params.password,
      deviceId: params.deviceId,
      deviceOs: params.deviceOs,
    );
  }
}

class RegisterParams {
  final String name;
  final String email;
  final String password;
  final String deviceId;
  final String deviceOs;

  const RegisterParams({
    required this.name,
    required this.email,
    required this.password,
    required this.deviceId,
    required this.deviceOs,
  });
} 