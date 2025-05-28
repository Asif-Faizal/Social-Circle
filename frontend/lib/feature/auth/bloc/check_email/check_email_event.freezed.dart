// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_email_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CheckEmailEvent {

 String get email;
/// Create a copy of CheckEmailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckEmailEventCopyWith<CheckEmailEvent> get copyWith => _$CheckEmailEventCopyWithImpl<CheckEmailEvent>(this as CheckEmailEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckEmailEvent&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'CheckEmailEvent(email: $email)';
}


}

/// @nodoc
abstract mixin class $CheckEmailEventCopyWith<$Res>  {
  factory $CheckEmailEventCopyWith(CheckEmailEvent value, $Res Function(CheckEmailEvent) _then) = _$CheckEmailEventCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$CheckEmailEventCopyWithImpl<$Res>
    implements $CheckEmailEventCopyWith<$Res> {
  _$CheckEmailEventCopyWithImpl(this._self, this._then);

  final CheckEmailEvent _self;
  final $Res Function(CheckEmailEvent) _then;

/// Create a copy of CheckEmailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _CheckEmail implements CheckEmailEvent {
  const _CheckEmail(this.email);
  

@override final  String email;

/// Create a copy of CheckEmailEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckEmailCopyWith<_CheckEmail> get copyWith => __$CheckEmailCopyWithImpl<_CheckEmail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckEmail&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'CheckEmailEvent.checkEmail(email: $email)';
}


}

/// @nodoc
abstract mixin class _$CheckEmailCopyWith<$Res> implements $CheckEmailEventCopyWith<$Res> {
  factory _$CheckEmailCopyWith(_CheckEmail value, $Res Function(_CheckEmail) _then) = __$CheckEmailCopyWithImpl;
@override @useResult
$Res call({
 String email
});




}
/// @nodoc
class __$CheckEmailCopyWithImpl<$Res>
    implements _$CheckEmailCopyWith<$Res> {
  __$CheckEmailCopyWithImpl(this._self, this._then);

  final _CheckEmail _self;
  final $Res Function(_CheckEmail) _then;

/// Create a copy of CheckEmailEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(_CheckEmail(
null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
