//
//  Generated code. Do not modify.
//  source: chat.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use messageStatusDescriptor instead')
const MessageStatus$json = {
  '1': 'MessageStatus',
  '2': [
    {'1': 'SENT', '2': 0},
    {'1': 'DELIVERED', '2': 1},
    {'1': 'READ', '2': 2},
  ],
};

/// Descriptor for `MessageStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List messageStatusDescriptor = $convert.base64Decode(
    'Cg1NZXNzYWdlU3RhdHVzEggKBFNFTlQQABINCglERUxJVkVSRUQQARIICgRSRUFEEAI=');

@$core.Deprecated('Use streamSetupRequestDescriptor instead')
const StreamSetupRequest$json = {
  '1': 'StreamSetupRequest',
  '2': [
    {'1': 'sender_id', '3': 1, '4': 1, '5': 9, '10': 'senderId'},
    {'1': 'receiver_id', '3': 2, '4': 1, '5': 9, '10': 'receiverId'},
  ],
};

/// Descriptor for `StreamSetupRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamSetupRequestDescriptor = $convert.base64Decode(
    'ChJTdHJlYW1TZXR1cFJlcXVlc3QSGwoJc2VuZGVyX2lkGAEgASgJUghzZW5kZXJJZBIfCgtyZW'
    'NlaXZlcl9pZBgCIAEoCVIKcmVjZWl2ZXJJZA==');

@$core.Deprecated('Use newMessageDescriptor instead')
const NewMessage$json = {
  '1': 'NewMessage',
  '2': [
    {'1': 'content', '3': 1, '4': 1, '5': 9, '10': 'content'},
  ],
};

/// Descriptor for `NewMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List newMessageDescriptor = $convert.base64Decode(
    'CgpOZXdNZXNzYWdlEhgKB2NvbnRlbnQYASABKAlSB2NvbnRlbnQ=');

@$core.Deprecated('Use chatMessageDescriptor instead')
const ChatMessage$json = {
  '1': 'ChatMessage',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'sender_id', '3': 2, '4': 1, '5': 9, '10': 'senderId'},
    {'1': 'receiver_id', '3': 3, '4': 1, '5': 9, '10': 'receiverId'},
    {'1': 'content', '3': 4, '4': 1, '5': 9, '10': 'content'},
    {'1': 'timestamp_ms', '3': 5, '4': 1, '5': 3, '10': 'timestampMs'},
    {'1': 'status', '3': 6, '4': 1, '5': 14, '6': '.chat.MessageStatus', '10': 'status'},
  ],
};

/// Descriptor for `ChatMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatMessageDescriptor = $convert.base64Decode(
    'CgtDaGF0TWVzc2FnZRIOCgJpZBgBIAEoCVICaWQSGwoJc2VuZGVyX2lkGAIgASgJUghzZW5kZX'
    'JJZBIfCgtyZWNlaXZlcl9pZBgDIAEoCVIKcmVjZWl2ZXJJZBIYCgdjb250ZW50GAQgASgJUgdj'
    'b250ZW50EiEKDHRpbWVzdGFtcF9tcxgFIAEoA1ILdGltZXN0YW1wTXMSKwoGc3RhdHVzGAYgAS'
    'gOMhMuY2hhdC5NZXNzYWdlU3RhdHVzUgZzdGF0dXM=');

@$core.Deprecated('Use conversationStreamDescriptor instead')
const ConversationStream$json = {
  '1': 'ConversationStream',
  '2': [
    {'1': 'setup', '3': 1, '4': 1, '5': 11, '6': '.chat.StreamSetupRequest', '9': 0, '10': 'setup'},
    {'1': 'new_message', '3': 2, '4': 1, '5': 11, '6': '.chat.NewMessage', '9': 0, '10': 'newMessage'},
    {'1': 'chat_message', '3': 3, '4': 1, '5': 11, '6': '.chat.ChatMessage', '9': 0, '10': 'chatMessage'},
    {'1': 'status_update', '3': 4, '4': 1, '5': 11, '6': '.chat.MessageStatusUpdate', '9': 0, '10': 'statusUpdate'},
  ],
  '8': [
    {'1': 'event'},
  ],
};

/// Descriptor for `ConversationStream`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List conversationStreamDescriptor = $convert.base64Decode(
    'ChJDb252ZXJzYXRpb25TdHJlYW0SMAoFc2V0dXAYASABKAsyGC5jaGF0LlN0cmVhbVNldHVwUm'
    'VxdWVzdEgAUgVzZXR1cBIzCgtuZXdfbWVzc2FnZRgCIAEoCzIQLmNoYXQuTmV3TWVzc2FnZUgA'
    'UgpuZXdNZXNzYWdlEjYKDGNoYXRfbWVzc2FnZRgDIAEoCzIRLmNoYXQuQ2hhdE1lc3NhZ2VIAF'
    'ILY2hhdE1lc3NhZ2USQAoNc3RhdHVzX3VwZGF0ZRgEIAEoCzIZLmNoYXQuTWVzc2FnZVN0YXR1'
    'c1VwZGF0ZUgAUgxzdGF0dXNVcGRhdGVCBwoFZXZlbnQ=');

@$core.Deprecated('Use messageStatusUpdateDescriptor instead')
const MessageStatusUpdate$json = {
  '1': 'MessageStatusUpdate',
  '2': [
    {'1': 'message_id', '3': 1, '4': 1, '5': 9, '10': 'messageId'},
    {'1': 'status', '3': 2, '4': 1, '5': 14, '6': '.chat.MessageStatus', '10': 'status'},
  ],
};

/// Descriptor for `MessageStatusUpdate`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageStatusUpdateDescriptor = $convert.base64Decode(
    'ChNNZXNzYWdlU3RhdHVzVXBkYXRlEh0KCm1lc3NhZ2VfaWQYASABKAlSCW1lc3NhZ2VJZBIrCg'
    'ZzdGF0dXMYAiABKA4yEy5jaGF0Lk1lc3NhZ2VTdGF0dXNSBnN0YXR1cw==');

@$core.Deprecated('Use getChatHistoryRequestDescriptor instead')
const GetChatHistoryRequest$json = {
  '1': 'GetChatHistoryRequest',
  '2': [
    {'1': 'user_id_1', '3': 1, '4': 1, '5': 9, '10': 'userId1'},
    {'1': 'user_id_2', '3': 2, '4': 1, '5': 9, '10': 'userId2'},
    {'1': 'page_size', '3': 3, '4': 1, '5': 5, '10': 'pageSize'},
    {'1': 'page_number', '3': 4, '4': 1, '5': 5, '10': 'pageNumber'},
  ],
};

/// Descriptor for `GetChatHistoryRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getChatHistoryRequestDescriptor = $convert.base64Decode(
    'ChVHZXRDaGF0SGlzdG9yeVJlcXVlc3QSGgoJdXNlcl9pZF8xGAEgASgJUgd1c2VySWQxEhoKCX'
    'VzZXJfaWRfMhgCIAEoCVIHdXNlcklkMhIbCglwYWdlX3NpemUYAyABKAVSCHBhZ2VTaXplEh8K'
    'C3BhZ2VfbnVtYmVyGAQgASgFUgpwYWdlTnVtYmVy');

@$core.Deprecated('Use getChatHistoryResponseDescriptor instead')
const GetChatHistoryResponse$json = {
  '1': 'GetChatHistoryResponse',
  '2': [
    {'1': 'messages', '3': 1, '4': 3, '5': 11, '6': '.chat.ChatMessage', '10': 'messages'},
  ],
};

/// Descriptor for `GetChatHistoryResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getChatHistoryResponseDescriptor = $convert.base64Decode(
    'ChZHZXRDaGF0SGlzdG9yeVJlc3BvbnNlEi0KCG1lc3NhZ2VzGAEgAygLMhEuY2hhdC5DaGF0TW'
    'Vzc2FnZVIIbWVzc2FnZXM=');

