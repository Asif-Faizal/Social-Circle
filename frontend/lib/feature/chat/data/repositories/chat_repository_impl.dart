import 'package:dartz/dartz.dart';
import 'package:frontend/core/error/failures.dart';
import 'package:frontend/feature/chat/data/datasources/chat_remote_data_source.dart';
import 'package:frontend/feature/chat/data/datasources/generated/chat.pbgrpc.dart';
import 'package:frontend/feature/chat/domain/entities/chat_entity.dart';
import 'package:frontend/feature/chat/domain/repositories/chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource remoteDataSource;

  ChatRepositoryImpl({required this.remoteDataSource});

  @override
  Either<Failure, Stream<ChatMessageEntity>> converse(Stream<ConversationStream> stream) {
    try {
      final result = remoteDataSource.converse(stream);
      final entityStream = result.map((chatMessage) => ChatMessageEntity(
            id: chatMessage.id,
            senderId: chatMessage.senderId,
            receiverId: chatMessage.receiverId,
            content: chatMessage.content,
            timestamp: DateTime.fromMillisecondsSinceEpoch(chatMessage.timestampMs.toInt()),
            status: chatMessage.status.name,
          ));
      return Right(entityStream);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, List<ChatMessageEntity>>> getChatHistory(String userId1, String userId2) async {
    try {
      final result = await remoteDataSource.getChatHistory(userId1, userId2);
      final entities = result.map((chatMessage) => ChatMessageEntity(
            id: chatMessage.id,
            senderId: chatMessage.senderId,
            receiverId: chatMessage.receiverId,
            content: chatMessage.content,
            timestamp: DateTime.fromMillisecondsSinceEpoch(chatMessage.timestampMs.toInt()),
            status: chatMessage.status.name,
          )).toList();
      return Right(entities);
    } on Failure catch (e) {
      return Left(e);
    }
  }
} 