// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OtpState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OtpState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OtpState()';
}


}

/// @nodoc
class $OtpStateCopyWith<$Res>  {
$OtpStateCopyWith(OtpState _, $Res Function(OtpState) __);
}


/// @nodoc


class _Initial extends OtpState {
  const _Initial(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OtpState.initial()';
}


}




/// @nodoc


class _Loading extends OtpState {
  const _Loading(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OtpState.loading()';
}


}




/// @nodoc


class _OtpEntered extends OtpState {
  const _OtpEntered({required this.otp}): super._();
  

 final  String otp;

/// Create a copy of OtpState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OtpEnteredCopyWith<_OtpEntered> get copyWith => __$OtpEnteredCopyWithImpl<_OtpEntered>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OtpEntered&&(identical(other.otp, otp) || other.otp == otp));
}


@override
int get hashCode => Object.hash(runtimeType,otp);

@override
String toString() {
  return 'OtpState.otpEntered(otp: $otp)';
}


}

/// @nodoc
abstract mixin class _$OtpEnteredCopyWith<$Res> implements $OtpStateCopyWith<$Res> {
  factory _$OtpEnteredCopyWith(_OtpEntered value, $Res Function(_OtpEntered) _then) = __$OtpEnteredCopyWithImpl;
@useResult
$Res call({
 String otp
});




}
/// @nodoc
class __$OtpEnteredCopyWithImpl<$Res>
    implements _$OtpEnteredCopyWith<$Res> {
  __$OtpEnteredCopyWithImpl(this._self, this._then);

  final _OtpEntered _self;
  final $Res Function(_OtpEntered) _then;

/// Create a copy of OtpState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? otp = null,}) {
  return _then(_OtpEntered(
otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _OtpValidationSuccess extends OtpState {
  const _OtpValidationSuccess(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OtpValidationSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OtpState.otpValidationSuccess()';
}


}




/// @nodoc


class _OtpValidationFailure extends OtpState {
  const _OtpValidationFailure({this.message}): super._();
  

 final  String? message;

/// Create a copy of OtpState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OtpValidationFailureCopyWith<_OtpValidationFailure> get copyWith => __$OtpValidationFailureCopyWithImpl<_OtpValidationFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OtpValidationFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'OtpState.otpValidationFailure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$OtpValidationFailureCopyWith<$Res> implements $OtpStateCopyWith<$Res> {
  factory _$OtpValidationFailureCopyWith(_OtpValidationFailure value, $Res Function(_OtpValidationFailure) _then) = __$OtpValidationFailureCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class __$OtpValidationFailureCopyWithImpl<$Res>
    implements _$OtpValidationFailureCopyWith<$Res> {
  __$OtpValidationFailureCopyWithImpl(this._self, this._then);

  final _OtpValidationFailure _self;
  final $Res Function(_OtpValidationFailure) _then;

/// Create a copy of OtpState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(_OtpValidationFailure(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
