import 'package:dartz/dartz.dart';
import 'package:frontend/core/error/failures.dart';
import 'package:frontend/feature/chat/data/datasources/generated/chat.pbgrpc.dart';
import 'package:frontend/feature/chat/domain/entities/chat_entity.dart';

abstract class ChatRepository {
  Either<Failure, Stream<ChatMessageEntity>> converse(Stream<ConversationStream> stream);
  Future<Either<Failure, List<ChatMessageEntity>>> getChatHistory(String userId1, String userId2);
} 