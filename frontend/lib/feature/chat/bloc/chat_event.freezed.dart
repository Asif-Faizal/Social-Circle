// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatEvent()';
}


}

/// @nodoc
class $ChatEventCopyWith<$Res>  {
$ChatEventCopyWith(ChatEvent _, $Res Function(ChatEvent) __);
}


/// @nodoc


class Connect implements ChatEvent {
  const Connect({required this.selfId, required this.peerId});
  

 final  String selfId;
 final  String peerId;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConnectCopyWith<Connect> get copyWith => _$ConnectCopyWithImpl<Connect>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Connect&&(identical(other.selfId, selfId) || other.selfId == selfId)&&(identical(other.peerId, peerId) || other.peerId == peerId));
}


@override
int get hashCode => Object.hash(runtimeType,selfId,peerId);

@override
String toString() {
  return 'ChatEvent.connect(selfId: $selfId, peerId: $peerId)';
}


}

/// @nodoc
abstract mixin class $ConnectCopyWith<$Res> implements $ChatEventCopyWith<$Res> {
  factory $ConnectCopyWith(Connect value, $Res Function(Connect) _then) = _$ConnectCopyWithImpl;
@useResult
$Res call({
 String selfId, String peerId
});




}
/// @nodoc
class _$ConnectCopyWithImpl<$Res>
    implements $ConnectCopyWith<$Res> {
  _$ConnectCopyWithImpl(this._self, this._then);

  final Connect _self;
  final $Res Function(Connect) _then;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? selfId = null,Object? peerId = null,}) {
  return _then(Connect(
selfId: null == selfId ? _self.selfId : selfId // ignore: cast_nullable_to_non_nullable
as String,peerId: null == peerId ? _self.peerId : peerId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SendMessage implements ChatEvent {
  const SendMessage({required this.message});
  

 final  String message;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendMessageCopyWith<SendMessage> get copyWith => _$SendMessageCopyWithImpl<SendMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendMessage&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ChatEvent.sendMessage(message: $message)';
}


}

/// @nodoc
abstract mixin class $SendMessageCopyWith<$Res> implements $ChatEventCopyWith<$Res> {
  factory $SendMessageCopyWith(SendMessage value, $Res Function(SendMessage) _then) = _$SendMessageCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$SendMessageCopyWithImpl<$Res>
    implements $SendMessageCopyWith<$Res> {
  _$SendMessageCopyWithImpl(this._self, this._then);

  final SendMessage _self;
  final $Res Function(SendMessage) _then;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(SendMessage(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class MessageReceived implements ChatEvent {
  const MessageReceived({required this.message});
  

 final  ChatMessageEntity message;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageReceivedCopyWith<MessageReceived> get copyWith => _$MessageReceivedCopyWithImpl<MessageReceived>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageReceived&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ChatEvent.messageReceived(message: $message)';
}


}

/// @nodoc
abstract mixin class $MessageReceivedCopyWith<$Res> implements $ChatEventCopyWith<$Res> {
  factory $MessageReceivedCopyWith(MessageReceived value, $Res Function(MessageReceived) _then) = _$MessageReceivedCopyWithImpl;
@useResult
$Res call({
 ChatMessageEntity message
});




}
/// @nodoc
class _$MessageReceivedCopyWithImpl<$Res>
    implements $MessageReceivedCopyWith<$Res> {
  _$MessageReceivedCopyWithImpl(this._self, this._then);

  final MessageReceived _self;
  final $Res Function(MessageReceived) _then;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(MessageReceived(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as ChatMessageEntity,
  ));
}


}

/// @nodoc


class LoadHistory implements ChatEvent {
  const LoadHistory({required this.selfId, required this.peerId});
  

 final  String selfId;
 final  String peerId;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadHistoryCopyWith<LoadHistory> get copyWith => _$LoadHistoryCopyWithImpl<LoadHistory>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadHistory&&(identical(other.selfId, selfId) || other.selfId == selfId)&&(identical(other.peerId, peerId) || other.peerId == peerId));
}


@override
int get hashCode => Object.hash(runtimeType,selfId,peerId);

@override
String toString() {
  return 'ChatEvent.loadHistory(selfId: $selfId, peerId: $peerId)';
}


}

/// @nodoc
abstract mixin class $LoadHistoryCopyWith<$Res> implements $ChatEventCopyWith<$Res> {
  factory $LoadHistoryCopyWith(LoadHistory value, $Res Function(LoadHistory) _then) = _$LoadHistoryCopyWithImpl;
@useResult
$Res call({
 String selfId, String peerId
});




}
/// @nodoc
class _$LoadHistoryCopyWithImpl<$Res>
    implements $LoadHistoryCopyWith<$Res> {
  _$LoadHistoryCopyWithImpl(this._self, this._then);

  final LoadHistory _self;
  final $Res Function(LoadHistory) _then;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? selfId = null,Object? peerId = null,}) {
  return _then(LoadHistory(
selfId: null == selfId ? _self.selfId : selfId // ignore: cast_nullable_to_non_nullable
as String,peerId: null == peerId ? _self.peerId : peerId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class Disconnect implements ChatEvent {
  const Disconnect();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Disconnect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatEvent.disconnect()';
}


}




// dart format on
