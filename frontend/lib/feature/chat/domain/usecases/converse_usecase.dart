import 'package:dartz/dartz.dart';
import 'package:frontend/core/error/failures.dart';
import 'package:frontend/core/usecases/usecase.dart';
import 'package:frontend/feature/chat/data/datasources/generated/chat.pbgrpc.dart';
import 'package:frontend/feature/chat/domain/entities/chat_entity.dart';
import 'package:frontend/feature/chat/domain/repositories/chat_repository.dart';

class ConverseUseCase implements StreamUseCase<ChatMessageEntity, Stream<ConversationStream>> {
  final ChatRepository repository;

  ConverseUseCase(this.repository);

  @override
  Either<Failure, Stream<ChatMessageEntity>> call(Stream<ConversationStream> params) {
    return repository.converse(params);
  }
} 