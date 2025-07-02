//
//  Generated code. Do not modify.
//  source: chat.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'chat.pb.dart' as $0;

export 'chat.pb.dart';

@$pb.GrpcServiceName('chat.ChatService')
class ChatServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  static final _$converse = $grpc.ClientMethod<$0.ConversationStream, $0.ConversationStream>(
      '/chat.ChatService/Converse',
      ($0.ConversationStream value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ConversationStream.fromBuffer(value));
  static final _$getChatHistory = $grpc.ClientMethod<$0.GetChatHistoryRequest, $0.GetChatHistoryResponse>(
      '/chat.ChatService/GetChatHistory',
      ($0.GetChatHistoryRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetChatHistoryResponse.fromBuffer(value));

  ChatServiceClient(super.channel, {super.options, super.interceptors});

  /// Establishes a dedicated, bidirectional stream for a conversation between two users.
  $grpc.ResponseStream<$0.ConversationStream> converse($async.Stream<$0.ConversationStream> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$converse, request, options: options);
  }

  /// Get chat history between two users
  $grpc.ResponseFuture<$0.GetChatHistoryResponse> getChatHistory($0.GetChatHistoryRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getChatHistory, request, options: options);
  }
}

@$pb.GrpcServiceName('chat.ChatService')
abstract class ChatServiceBase extends $grpc.Service {
  $core.String get $name => 'chat.ChatService';

  ChatServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ConversationStream, $0.ConversationStream>(
        'Converse',
        converse,
        true,
        true,
        ($core.List<$core.int> value) => $0.ConversationStream.fromBuffer(value),
        ($0.ConversationStream value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetChatHistoryRequest, $0.GetChatHistoryResponse>(
        'GetChatHistory',
        getChatHistory_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetChatHistoryRequest.fromBuffer(value),
        ($0.GetChatHistoryResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetChatHistoryResponse> getChatHistory_Pre($grpc.ServiceCall $call, $async.Future<$0.GetChatHistoryRequest> $request) async {
    return getChatHistory($call, await $request);
  }

  $async.Stream<$0.ConversationStream> converse($grpc.ServiceCall call, $async.Stream<$0.ConversationStream> request);
  $async.Future<$0.GetChatHistoryResponse> getChatHistory($grpc.ServiceCall call, $0.GetChatHistoryRequest request);
}
