//
//  Generated code. Do not modify.
//  source: chat.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'chat.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'chat.pbenum.dart';

/// The first message from the client MUST be a setup request.
class StreamSetupRequest extends $pb.GeneratedMessage {
  factory StreamSetupRequest({
    $core.String? senderId,
    $core.String? receiverId,
  }) {
    final $result = create();
    if (senderId != null) {
      $result.senderId = senderId;
    }
    if (receiverId != null) {
      $result.receiverId = receiverId;
    }
    return $result;
  }
  StreamSetupRequest._() : super();
  factory StreamSetupRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StreamSetupRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StreamSetupRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'senderId')
    ..aOS(2, _omitFieldNames ? '' : 'receiverId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StreamSetupRequest clone() => StreamSetupRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StreamSetupRequest copyWith(void Function(StreamSetupRequest) updates) => super.copyWith((message) => updates(message as StreamSetupRequest)) as StreamSetupRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StreamSetupRequest create() => StreamSetupRequest._();
  StreamSetupRequest createEmptyInstance() => create();
  static $pb.PbList<StreamSetupRequest> createRepeated() => $pb.PbList<StreamSetupRequest>();
  @$core.pragma('dart2js:noInline')
  static StreamSetupRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StreamSetupRequest>(create);
  static StreamSetupRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get senderId => $_getSZ(0);
  @$pb.TagNumber(1)
  set senderId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSenderId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSenderId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get receiverId => $_getSZ(1);
  @$pb.TagNumber(2)
  set receiverId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasReceiverId() => $_has(1);
  @$pb.TagNumber(2)
  void clearReceiverId() => $_clearField(2);
}

/// A message sent from the client to the server within an established conversation.
/// It doesn't need sender/receiver info because the stream itself defines the participants.
class NewMessage extends $pb.GeneratedMessage {
  factory NewMessage({
    $core.String? content,
  }) {
    final $result = create();
    if (content != null) {
      $result.content = content;
    }
    return $result;
  }
  NewMessage._() : super();
  factory NewMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NewMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NewMessage', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'content')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NewMessage clone() => NewMessage()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NewMessage copyWith(void Function(NewMessage) updates) => super.copyWith((message) => updates(message as NewMessage)) as NewMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NewMessage create() => NewMessage._();
  NewMessage createEmptyInstance() => create();
  static $pb.PbList<NewMessage> createRepeated() => $pb.PbList<NewMessage>();
  @$core.pragma('dart2js:noInline')
  static NewMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NewMessage>(create);
  static NewMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get content => $_getSZ(0);
  @$pb.TagNumber(1)
  set content($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasContent() => $_has(0);
  @$pb.TagNumber(1)
  void clearContent() => $_clearField(1);
}

/// A full chat message as stored in the DB and sent from the server to clients.
class ChatMessage extends $pb.GeneratedMessage {
  factory ChatMessage({
    $core.String? id,
    $core.String? senderId,
    $core.String? receiverId,
    $core.String? content,
    $fixnum.Int64? timestampMs,
    MessageStatus? status,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (senderId != null) {
      $result.senderId = senderId;
    }
    if (receiverId != null) {
      $result.receiverId = receiverId;
    }
    if (content != null) {
      $result.content = content;
    }
    if (timestampMs != null) {
      $result.timestampMs = timestampMs;
    }
    if (status != null) {
      $result.status = status;
    }
    return $result;
  }
  ChatMessage._() : super();
  factory ChatMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChatMessage', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'senderId')
    ..aOS(3, _omitFieldNames ? '' : 'receiverId')
    ..aOS(4, _omitFieldNames ? '' : 'content')
    ..aInt64(5, _omitFieldNames ? '' : 'timestampMs')
    ..e<MessageStatus>(6, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: MessageStatus.SENT, valueOf: MessageStatus.valueOf, enumValues: MessageStatus.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatMessage clone() => ChatMessage()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatMessage copyWith(void Function(ChatMessage) updates) => super.copyWith((message) => updates(message as ChatMessage)) as ChatMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatMessage create() => ChatMessage._();
  ChatMessage createEmptyInstance() => create();
  static $pb.PbList<ChatMessage> createRepeated() => $pb.PbList<ChatMessage>();
  @$core.pragma('dart2js:noInline')
  static ChatMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatMessage>(create);
  static ChatMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get senderId => $_getSZ(1);
  @$pb.TagNumber(2)
  set senderId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSenderId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSenderId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get receiverId => $_getSZ(2);
  @$pb.TagNumber(3)
  set receiverId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasReceiverId() => $_has(2);
  @$pb.TagNumber(3)
  void clearReceiverId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get content => $_getSZ(3);
  @$pb.TagNumber(4)
  set content($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasContent() => $_has(3);
  @$pb.TagNumber(4)
  void clearContent() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get timestampMs => $_getI64(4);
  @$pb.TagNumber(5)
  set timestampMs($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTimestampMs() => $_has(4);
  @$pb.TagNumber(5)
  void clearTimestampMs() => $_clearField(5);

  @$pb.TagNumber(6)
  MessageStatus get status => $_getN(5);
  @$pb.TagNumber(6)
  set status(MessageStatus v) { $_setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasStatus() => $_has(5);
  @$pb.TagNumber(6)
  void clearStatus() => $_clearField(6);
}

enum ConversationStream_Event {
  setup, 
  newMessage, 
  chatMessage, 
  statusUpdate, 
  notSet
}

/// The message wrapper for the conversation stream.
class ConversationStream extends $pb.GeneratedMessage {
  factory ConversationStream({
    StreamSetupRequest? setup,
    NewMessage? newMessage,
    ChatMessage? chatMessage,
    MessageStatusUpdate? statusUpdate,
  }) {
    final $result = create();
    if (setup != null) {
      $result.setup = setup;
    }
    if (newMessage != null) {
      $result.newMessage = newMessage;
    }
    if (chatMessage != null) {
      $result.chatMessage = chatMessage;
    }
    if (statusUpdate != null) {
      $result.statusUpdate = statusUpdate;
    }
    return $result;
  }
  ConversationStream._() : super();
  factory ConversationStream.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConversationStream.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, ConversationStream_Event> _ConversationStream_EventByTag = {
    1 : ConversationStream_Event.setup,
    2 : ConversationStream_Event.newMessage,
    3 : ConversationStream_Event.chatMessage,
    4 : ConversationStream_Event.statusUpdate,
    0 : ConversationStream_Event.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ConversationStream', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4])
    ..aOM<StreamSetupRequest>(1, _omitFieldNames ? '' : 'setup', subBuilder: StreamSetupRequest.create)
    ..aOM<NewMessage>(2, _omitFieldNames ? '' : 'newMessage', subBuilder: NewMessage.create)
    ..aOM<ChatMessage>(3, _omitFieldNames ? '' : 'chatMessage', subBuilder: ChatMessage.create)
    ..aOM<MessageStatusUpdate>(4, _omitFieldNames ? '' : 'statusUpdate', subBuilder: MessageStatusUpdate.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConversationStream clone() => ConversationStream()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConversationStream copyWith(void Function(ConversationStream) updates) => super.copyWith((message) => updates(message as ConversationStream)) as ConversationStream;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConversationStream create() => ConversationStream._();
  ConversationStream createEmptyInstance() => create();
  static $pb.PbList<ConversationStream> createRepeated() => $pb.PbList<ConversationStream>();
  @$core.pragma('dart2js:noInline')
  static ConversationStream getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConversationStream>(create);
  static ConversationStream? _defaultInstance;

  ConversationStream_Event whichEvent() => _ConversationStream_EventByTag[$_whichOneof(0)]!;
  void clearEvent() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  StreamSetupRequest get setup => $_getN(0);
  @$pb.TagNumber(1)
  set setup(StreamSetupRequest v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSetup() => $_has(0);
  @$pb.TagNumber(1)
  void clearSetup() => $_clearField(1);
  @$pb.TagNumber(1)
  StreamSetupRequest ensureSetup() => $_ensure(0);

  @$pb.TagNumber(2)
  NewMessage get newMessage => $_getN(1);
  @$pb.TagNumber(2)
  set newMessage(NewMessage v) { $_setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasNewMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearNewMessage() => $_clearField(2);
  @$pb.TagNumber(2)
  NewMessage ensureNewMessage() => $_ensure(1);

  @$pb.TagNumber(3)
  ChatMessage get chatMessage => $_getN(2);
  @$pb.TagNumber(3)
  set chatMessage(ChatMessage v) { $_setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasChatMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearChatMessage() => $_clearField(3);
  @$pb.TagNumber(3)
  ChatMessage ensureChatMessage() => $_ensure(2);

  @$pb.TagNumber(4)
  MessageStatusUpdate get statusUpdate => $_getN(3);
  @$pb.TagNumber(4)
  set statusUpdate(MessageStatusUpdate v) { $_setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasStatusUpdate() => $_has(3);
  @$pb.TagNumber(4)
  void clearStatusUpdate() => $_clearField(4);
  @$pb.TagNumber(4)
  MessageStatusUpdate ensureStatusUpdate() => $_ensure(3);
}

class MessageStatusUpdate extends $pb.GeneratedMessage {
  factory MessageStatusUpdate({
    $core.String? messageId,
    MessageStatus? status,
  }) {
    final $result = create();
    if (messageId != null) {
      $result.messageId = messageId;
    }
    if (status != null) {
      $result.status = status;
    }
    return $result;
  }
  MessageStatusUpdate._() : super();
  factory MessageStatusUpdate.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MessageStatusUpdate.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MessageStatusUpdate', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'messageId')
    ..e<MessageStatus>(2, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: MessageStatus.SENT, valueOf: MessageStatus.valueOf, enumValues: MessageStatus.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MessageStatusUpdate clone() => MessageStatusUpdate()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MessageStatusUpdate copyWith(void Function(MessageStatusUpdate) updates) => super.copyWith((message) => updates(message as MessageStatusUpdate)) as MessageStatusUpdate;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MessageStatusUpdate create() => MessageStatusUpdate._();
  MessageStatusUpdate createEmptyInstance() => create();
  static $pb.PbList<MessageStatusUpdate> createRepeated() => $pb.PbList<MessageStatusUpdate>();
  @$core.pragma('dart2js:noInline')
  static MessageStatusUpdate getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MessageStatusUpdate>(create);
  static MessageStatusUpdate? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get messageId => $_getSZ(0);
  @$pb.TagNumber(1)
  set messageId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessageId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessageId() => $_clearField(1);

  @$pb.TagNumber(2)
  MessageStatus get status => $_getN(1);
  @$pb.TagNumber(2)
  set status(MessageStatus v) { $_setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => $_clearField(2);
}

class GetChatHistoryRequest extends $pb.GeneratedMessage {
  factory GetChatHistoryRequest({
    $core.String? userId1,
    $core.String? userId2,
    $core.int? pageSize,
    $core.int? pageNumber,
  }) {
    final $result = create();
    if (userId1 != null) {
      $result.userId1 = userId1;
    }
    if (userId2 != null) {
      $result.userId2 = userId2;
    }
    if (pageSize != null) {
      $result.pageSize = pageSize;
    }
    if (pageNumber != null) {
      $result.pageNumber = pageNumber;
    }
    return $result;
  }
  GetChatHistoryRequest._() : super();
  factory GetChatHistoryRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetChatHistoryRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetChatHistoryRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId1', protoName: 'user_id_1')
    ..aOS(2, _omitFieldNames ? '' : 'userId2', protoName: 'user_id_2')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'pageSize', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'pageNumber', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetChatHistoryRequest clone() => GetChatHistoryRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetChatHistoryRequest copyWith(void Function(GetChatHistoryRequest) updates) => super.copyWith((message) => updates(message as GetChatHistoryRequest)) as GetChatHistoryRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetChatHistoryRequest create() => GetChatHistoryRequest._();
  GetChatHistoryRequest createEmptyInstance() => create();
  static $pb.PbList<GetChatHistoryRequest> createRepeated() => $pb.PbList<GetChatHistoryRequest>();
  @$core.pragma('dart2js:noInline')
  static GetChatHistoryRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetChatHistoryRequest>(create);
  static GetChatHistoryRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId1 => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId1($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId1() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId1() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId2 => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId2($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId2() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId2() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get pageSize => $_getIZ(2);
  @$pb.TagNumber(3)
  set pageSize($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPageSize() => $_has(2);
  @$pb.TagNumber(3)
  void clearPageSize() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get pageNumber => $_getIZ(3);
  @$pb.TagNumber(4)
  set pageNumber($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPageNumber() => $_has(3);
  @$pb.TagNumber(4)
  void clearPageNumber() => $_clearField(4);
}

class GetChatHistoryResponse extends $pb.GeneratedMessage {
  factory GetChatHistoryResponse({
    $core.Iterable<ChatMessage>? messages,
  }) {
    final $result = create();
    if (messages != null) {
      $result.messages.addAll(messages);
    }
    return $result;
  }
  GetChatHistoryResponse._() : super();
  factory GetChatHistoryResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetChatHistoryResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetChatHistoryResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..pc<ChatMessage>(1, _omitFieldNames ? '' : 'messages', $pb.PbFieldType.PM, subBuilder: ChatMessage.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetChatHistoryResponse clone() => GetChatHistoryResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetChatHistoryResponse copyWith(void Function(GetChatHistoryResponse) updates) => super.copyWith((message) => updates(message as GetChatHistoryResponse)) as GetChatHistoryResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetChatHistoryResponse create() => GetChatHistoryResponse._();
  GetChatHistoryResponse createEmptyInstance() => create();
  static $pb.PbList<GetChatHistoryResponse> createRepeated() => $pb.PbList<GetChatHistoryResponse>();
  @$core.pragma('dart2js:noInline')
  static GetChatHistoryResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetChatHistoryResponse>(create);
  static GetChatHistoryResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<ChatMessage> get messages => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
