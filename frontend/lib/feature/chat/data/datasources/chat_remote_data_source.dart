import 'package:frontend/core/error/failures.dart';
import 'package:frontend/core/network/network_info.dart';
import 'package:frontend/feature/chat/data/datasources/generated/chat.pbgrpc.dart';
import 'package:grpc/grpc.dart';

abstract class ChatRemoteDataSource {
  Stream<ChatMessage> converse(Stream<ConversationStream> stream);
  Future<List<ChatMessage>> getChatHistory(String userId1, String userId2);
}

class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  final ClientChannel channel;
  final NetworkInfo networkInfo;
  late final ChatServiceClient _client;

  ChatRemoteDataSourceImpl({required this.channel, required this.networkInfo}) {
    _client = ChatServiceClient(channel);
  }

  @override
  Stream<ChatMessage> converse(Stream<ConversationStream> requestStream) {
    try {
      networkInfo.checkConnectivity();
      
      final responseStream = _client.converse(requestStream);

      // We only care about the chat_message part of the stream from the server
      return responseStream
          .where((event) => event.hasChatMessage())
          .map((event) => event.chatMessage)
          .handleError((e) {
            if (e is GrpcError) {
                throw NetworkFailure('gRPC Error: ${e.message}');
            }
            throw const NetworkFailure('An unexpected network error occurred');
          });

    } on NetworkFailure {
        rethrow;
    } catch (e) {
      throw const NetworkFailure('An unexpected error occurred');
    }
  }

  @override
  Future<List<ChatMessage>> getChatHistory(String userId1, String userId2) async {
    try {
      await networkInfo.checkConnectivity();
      
      final request = GetChatHistoryRequest(
        userId1: userId1,
        userId2: userId2,
        pageSize: 50, // Or make this configurable
        pageNumber: 1, // Start from page 1
      );
      final response = await _client.getChatHistory(request);
      return response.messages;
    } on GrpcError catch (e) {
        throw NetworkFailure('gRPC Error: ${e.message}');
    } on NetworkFailure {
        rethrow;
    }
     catch (e) {
      throw const NetworkFailure('An unexpected error occurred');
    }
  }
} 