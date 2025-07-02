import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:frontend/feature/chat/data/datasources/generated/chat.pbgrpc.dart';
import 'package:frontend/feature/chat/domain/entities/chat_entity.dart';
import 'package:frontend/feature/chat/domain/usecases/converse_usecase.dart';
import 'package:frontend/feature/chat/domain/usecases/get_chat_history_usecase.dart';

import 'chat_event.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ConverseUseCase _converseUseCase;
  final GetChatHistoryUseCase _getChatHistoryUseCase;
  StreamSubscription<ChatMessageEntity>? _messageSubscription;
  StreamController<ConversationStream>? _requestStreamController;

  ChatBloc({
    required ConverseUseCase converseUseCase,
    required GetChatHistoryUseCase getChatHistoryUseCase,
  })  : _converseUseCase = converseUseCase,
        _getChatHistoryUseCase = getChatHistoryUseCase,
        super(const ChatState.initial()) {
    on<Connect>(_onConnect);
    on<SendMessage>(_onSendMessage);
    on<MessageReceived>(_onMessageReceived);
    on<LoadHistory>(_onLoadHistory);
    on<Disconnect>(_onDisconnect);
  }

  void _onConnect(Connect event, Emitter<ChatState> emit) {
    emit(const ChatState.connecting());
    _requestStreamController = StreamController<ConversationStream>();
    
    final result = _converseUseCase.call(_requestStreamController!.stream);
    
    result.fold(
      (failure) => emit(ChatState.error(message: failure.message)),
      (messageStream) {
        _messageSubscription = messageStream.listen(
          (message) => add(ChatEvent.messageReceived(message: message)),
          onError: (error) => emit(ChatState.error(message: error.toString())),
          onDone: () => add(const ChatEvent.disconnect()),
        );
        // Send the setup request
        _requestStreamController!.add(
          ConversationStream(
            setup: StreamSetupRequest(
              senderId: event.selfId,
              receiverId: event.peerId,
            ),
          ),
        );
        emit(const ChatState.connected(messages: [], isLoadingHistory: true));
        add(ChatEvent.loadHistory(selfId: event.selfId, peerId: event.peerId));
      },
    );
  }

  void _onSendMessage(SendMessage event, Emitter<ChatState> emit) {
    _requestStreamController?.add(
      ConversationStream(
        newMessage: NewMessage(content: event.message),
      ),
    );
  }

  void _onMessageReceived(MessageReceived event, Emitter<ChatState> emit) {
    if (state.runtimeType.toString().contains('Connected')) {
      // Cast to dynamic to access messages, then cast back
      final connected = state as dynamic;
      if (connected.messages != null) {
        final updatedMessages = List<ChatMessageEntity>.from(connected.messages)
          ..add(event.message);
        emit(ChatState.connected(
          messages: updatedMessages, 
          isLoadingHistory: connected.isLoadingHistory ?? false,
        ));
      } 
    }
  }

  Future<void> _onLoadHistory(LoadHistory event, Emitter<ChatState> emit) async {
    final result = await _getChatHistoryUseCase.call(
      GetChatHistoryParams(userId1: event.selfId, userId2: event.peerId),
    );
    result.fold(
      (failure) => emit(ChatState.error(message: failure.message)),
      (history) {
        if (state.runtimeType.toString().contains('Connected')) {
          final connected = state as dynamic;
          if (connected.messages != null) {
            final allMessages = [...history, ...connected.messages]
              ..sort((a, b) => a.timestamp.compareTo(b.timestamp));
            emit(ChatState.connected(
              messages: allMessages.cast<ChatMessageEntity>().toList(),
              isLoadingHistory: false, // History loading completed
            ));
          }
        }
      },
    );
  }

  void _onDisconnect(Disconnect event, Emitter<ChatState> emit) {
    _messageSubscription?.cancel();
    _requestStreamController?.close();
    emit(const ChatState.disconnected());
  }

  @override
  Future<void> close() {
    _messageSubscription?.cancel();
    _requestStreamController?.close();
    return super.close();
  }
} 