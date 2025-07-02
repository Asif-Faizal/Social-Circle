import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/feature/chat/domain/entities/chat_entity.dart';

part 'chat_state.freezed.dart';

@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.pascal)
class ChatState with _$ChatState {
  const factory ChatState.initial() = _Initial;
  const factory ChatState.connecting() = _Connecting;
  const factory ChatState.connected({
    required List<ChatMessageEntity> messages,
    @Default(false) bool isLoadingHistory,
  }) = _Connected;
  const factory ChatState.disconnected() = _Disconnected;
  const factory ChatState.error({required String message}) = _Error;
} 