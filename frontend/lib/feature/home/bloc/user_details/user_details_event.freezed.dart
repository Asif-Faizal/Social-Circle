// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_details_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserDetailsEvent {

 String get deviceId; String get accessToken;
/// Create a copy of UserDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserDetailsEventCopyWith<UserDetailsEvent> get copyWith => _$UserDetailsEventCopyWithImpl<UserDetailsEvent>(this as UserDetailsEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserDetailsEvent&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken));
}


@override
int get hashCode => Object.hash(runtimeType,deviceId,accessToken);

@override
String toString() {
  return 'UserDetailsEvent(deviceId: $deviceId, accessToken: $accessToken)';
}


}

/// @nodoc
abstract mixin class $UserDetailsEventCopyWith<$Res>  {
  factory $UserDetailsEventCopyWith(UserDetailsEvent value, $Res Function(UserDetailsEvent) _then) = _$UserDetailsEventCopyWithImpl;
@useResult
$Res call({
 String deviceId, String accessToken
});




}
/// @nodoc
class _$UserDetailsEventCopyWithImpl<$Res>
    implements $UserDetailsEventCopyWith<$Res> {
  _$UserDetailsEventCopyWithImpl(this._self, this._then);

  final UserDetailsEvent _self;
  final $Res Function(UserDetailsEvent) _then;

/// Create a copy of UserDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? deviceId = null,Object? accessToken = null,}) {
  return _then(_self.copyWith(
deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _GetUserDetails implements UserDetailsEvent {
  const _GetUserDetails(this.deviceId, this.accessToken);
  

@override final  String deviceId;
@override final  String accessToken;

/// Create a copy of UserDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetUserDetailsCopyWith<_GetUserDetails> get copyWith => __$GetUserDetailsCopyWithImpl<_GetUserDetails>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetUserDetails&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken));
}


@override
int get hashCode => Object.hash(runtimeType,deviceId,accessToken);

@override
String toString() {
  return 'UserDetailsEvent.getUserDetails(deviceId: $deviceId, accessToken: $accessToken)';
}


}

/// @nodoc
abstract mixin class _$GetUserDetailsCopyWith<$Res> implements $UserDetailsEventCopyWith<$Res> {
  factory _$GetUserDetailsCopyWith(_GetUserDetails value, $Res Function(_GetUserDetails) _then) = __$GetUserDetailsCopyWithImpl;
@override @useResult
$Res call({
 String deviceId, String accessToken
});




}
/// @nodoc
class __$GetUserDetailsCopyWithImpl<$Res>
    implements _$GetUserDetailsCopyWith<$Res> {
  __$GetUserDetailsCopyWithImpl(this._self, this._then);

  final _GetUserDetails _self;
  final $Res Function(_GetUserDetails) _then;

/// Create a copy of UserDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? deviceId = null,Object? accessToken = null,}) {
  return _then(_GetUserDetails(
null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
