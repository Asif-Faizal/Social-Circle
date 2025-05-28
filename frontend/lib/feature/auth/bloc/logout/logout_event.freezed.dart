// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logout_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LogoutEvent {

 NoParams get params;
/// Create a copy of LogoutEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogoutEventCopyWith<LogoutEvent> get copyWith => _$LogoutEventCopyWithImpl<LogoutEvent>(this as LogoutEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogoutEvent&&(identical(other.params, params) || other.params == params));
}


@override
int get hashCode => Object.hash(runtimeType,params);

@override
String toString() {
  return 'LogoutEvent(params: $params)';
}


}

/// @nodoc
abstract mixin class $LogoutEventCopyWith<$Res>  {
  factory $LogoutEventCopyWith(LogoutEvent value, $Res Function(LogoutEvent) _then) = _$LogoutEventCopyWithImpl;
@useResult
$Res call({
 NoParams params
});




}
/// @nodoc
class _$LogoutEventCopyWithImpl<$Res>
    implements $LogoutEventCopyWith<$Res> {
  _$LogoutEventCopyWithImpl(this._self, this._then);

  final LogoutEvent _self;
  final $Res Function(LogoutEvent) _then;

/// Create a copy of LogoutEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? params = null,}) {
  return _then(_self.copyWith(
params: null == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as NoParams,
  ));
}

}


/// @nodoc


class _Logout implements LogoutEvent {
  const _Logout(this.params);
  

@override final  NoParams params;

/// Create a copy of LogoutEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LogoutCopyWith<_Logout> get copyWith => __$LogoutCopyWithImpl<_Logout>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Logout&&(identical(other.params, params) || other.params == params));
}


@override
int get hashCode => Object.hash(runtimeType,params);

@override
String toString() {
  return 'LogoutEvent.logout(params: $params)';
}


}

/// @nodoc
abstract mixin class _$LogoutCopyWith<$Res> implements $LogoutEventCopyWith<$Res> {
  factory _$LogoutCopyWith(_Logout value, $Res Function(_Logout) _then) = __$LogoutCopyWithImpl;
@override @useResult
$Res call({
 NoParams params
});




}
/// @nodoc
class __$LogoutCopyWithImpl<$Res>
    implements _$LogoutCopyWith<$Res> {
  __$LogoutCopyWithImpl(this._self, this._then);

  final _Logout _self;
  final $Res Function(_Logout) _then;

/// Create a copy of LogoutEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? params = null,}) {
  return _then(_Logout(
null == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as NoParams,
  ));
}


}

// dart format on
