import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/check_email.entity.dart';
import '../repositories/auth_repository.dart';

class CheckEmailUseCase implements UseCase<CheckEmailEntity, CheckEmailParams> {
  final AuthRepository repository;

  CheckEmailUseCase(this.repository);

  @override
  Future<Either<Failure, CheckEmailEntity>> call(CheckEmailParams params) async {
    return await repository.checkEmail(params.email);
  }
}

class CheckEmailParams extends Equatable {
  final String email;

  const CheckEmailParams({required this.email});

  @override
  List<Object> get props => [email];
} 