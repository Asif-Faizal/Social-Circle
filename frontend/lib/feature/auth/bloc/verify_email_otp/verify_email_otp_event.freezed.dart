// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_email_otp_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VerifyEmailOtpEvent {

 String get email; String get otp;
/// Create a copy of VerifyEmailOtpEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyEmailOtpEventCopyWith<VerifyEmailOtpEvent> get copyWith => _$VerifyEmailOtpEventCopyWithImpl<VerifyEmailOtpEvent>(this as VerifyEmailOtpEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyEmailOtpEvent&&(identical(other.email, email) || other.email == email)&&(identical(other.otp, otp) || other.otp == otp));
}


@override
int get hashCode => Object.hash(runtimeType,email,otp);

@override
String toString() {
  return 'VerifyEmailOtpEvent(email: $email, otp: $otp)';
}


}

/// @nodoc
abstract mixin class $VerifyEmailOtpEventCopyWith<$Res>  {
  factory $VerifyEmailOtpEventCopyWith(VerifyEmailOtpEvent value, $Res Function(VerifyEmailOtpEvent) _then) = _$VerifyEmailOtpEventCopyWithImpl;
@useResult
$Res call({
 String email, String otp
});




}
/// @nodoc
class _$VerifyEmailOtpEventCopyWithImpl<$Res>
    implements $VerifyEmailOtpEventCopyWith<$Res> {
  _$VerifyEmailOtpEventCopyWithImpl(this._self, this._then);

  final VerifyEmailOtpEvent _self;
  final $Res Function(VerifyEmailOtpEvent) _then;

/// Create a copy of VerifyEmailOtpEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? otp = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _VerifyEmailOtpEvent implements VerifyEmailOtpEvent {
  const _VerifyEmailOtpEvent({required this.email, required this.otp});
  

@override final  String email;
@override final  String otp;

/// Create a copy of VerifyEmailOtpEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyEmailOtpEventCopyWith<_VerifyEmailOtpEvent> get copyWith => __$VerifyEmailOtpEventCopyWithImpl<_VerifyEmailOtpEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyEmailOtpEvent&&(identical(other.email, email) || other.email == email)&&(identical(other.otp, otp) || other.otp == otp));
}


@override
int get hashCode => Object.hash(runtimeType,email,otp);

@override
String toString() {
  return 'VerifyEmailOtpEvent(email: $email, otp: $otp)';
}


}

/// @nodoc
abstract mixin class _$VerifyEmailOtpEventCopyWith<$Res> implements $VerifyEmailOtpEventCopyWith<$Res> {
  factory _$VerifyEmailOtpEventCopyWith(_VerifyEmailOtpEvent value, $Res Function(_VerifyEmailOtpEvent) _then) = __$VerifyEmailOtpEventCopyWithImpl;
@override @useResult
$Res call({
 String email, String otp
});




}
/// @nodoc
class __$VerifyEmailOtpEventCopyWithImpl<$Res>
    implements _$VerifyEmailOtpEventCopyWith<$Res> {
  __$VerifyEmailOtpEventCopyWithImpl(this._self, this._then);

  final _VerifyEmailOtpEvent _self;
  final $Res Function(_VerifyEmailOtpEvent) _then;

/// Create a copy of VerifyEmailOtpEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? otp = null,}) {
  return _then(_VerifyEmailOtpEvent(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
