// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sent_email_otp_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SentEmailOtpEvent {

 String get email;
/// Create a copy of SentEmailOtpEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SentEmailOtpEventCopyWith<SentEmailOtpEvent> get copyWith => _$SentEmailOtpEventCopyWithImpl<SentEmailOtpEvent>(this as SentEmailOtpEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SentEmailOtpEvent&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'SentEmailOtpEvent(email: $email)';
}


}

/// @nodoc
abstract mixin class $SentEmailOtpEventCopyWith<$Res>  {
  factory $SentEmailOtpEventCopyWith(SentEmailOtpEvent value, $Res Function(SentEmailOtpEvent) _then) = _$SentEmailOtpEventCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$SentEmailOtpEventCopyWithImpl<$Res>
    implements $SentEmailOtpEventCopyWith<$Res> {
  _$SentEmailOtpEventCopyWithImpl(this._self, this._then);

  final SentEmailOtpEvent _self;
  final $Res Function(SentEmailOtpEvent) _then;

/// Create a copy of SentEmailOtpEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _SentEmailOtpEvent implements SentEmailOtpEvent {
  const _SentEmailOtpEvent({required this.email});
  

@override final  String email;

/// Create a copy of SentEmailOtpEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SentEmailOtpEventCopyWith<_SentEmailOtpEvent> get copyWith => __$SentEmailOtpEventCopyWithImpl<_SentEmailOtpEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SentEmailOtpEvent&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'SentEmailOtpEvent(email: $email)';
}


}

/// @nodoc
abstract mixin class _$SentEmailOtpEventCopyWith<$Res> implements $SentEmailOtpEventCopyWith<$Res> {
  factory _$SentEmailOtpEventCopyWith(_SentEmailOtpEvent value, $Res Function(_SentEmailOtpEvent) _then) = __$SentEmailOtpEventCopyWithImpl;
@override @useResult
$Res call({
 String email
});




}
/// @nodoc
class __$SentEmailOtpEventCopyWithImpl<$Res>
    implements _$SentEmailOtpEventCopyWith<$Res> {
  __$SentEmailOtpEventCopyWithImpl(this._self, this._then);

  final _SentEmailOtpEvent _self;
  final $Res Function(_SentEmailOtpEvent) _then;

/// Create a copy of SentEmailOtpEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(_SentEmailOtpEvent(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
