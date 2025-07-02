import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/feature/chat/domain/entities/chat_entity.dart';

part 'chat_event.freezed.dart';

@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.pascal)
class ChatEvent with _$ChatEvent {
  const factory ChatEvent.connect({required String selfId, required String peerId}) = Connect;
  const factory ChatEvent.sendMessage({required String message}) = SendMessage;
  const factory ChatEvent.messageReceived({required ChatMessageEntity message}) = MessageReceived;
  const factory ChatEvent.loadHistory({required String selfId, required String peerId}) = LoadHistory;
  const factory ChatEvent.disconnect() = Disconnect;
} 