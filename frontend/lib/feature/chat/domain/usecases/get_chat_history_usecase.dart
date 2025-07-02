import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:frontend/core/error/failures.dart';
import 'package:frontend/core/usecases/usecase.dart';
import 'package:frontend/feature/chat/domain/entities/chat_entity.dart';
import 'package:frontend/feature/chat/domain/repositories/chat_repository.dart';

class GetChatHistoryUseCase implements UseCase<List<ChatMessageEntity>, GetChatHistoryParams> {
  final ChatRepository repository;

  GetChatHistoryUseCase(this.repository);

  @override
  Future<Either<Failure, List<ChatMessageEntity>>> call(GetChatHistoryParams params) {
    return repository.getChatHistory(params.userId1, params.userId2);
  }
}

class GetChatHistoryParams extends Equatable {
  final String userId1;
  final String userId2;

  const GetChatHistoryParams({required this.userId1, required this.userId2});

  @override
  List<Object?> get props => [userId1, userId2];
} 