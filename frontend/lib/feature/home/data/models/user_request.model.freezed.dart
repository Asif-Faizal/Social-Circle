// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_request.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserRequestModel {

 String get deviceId; String get accessToken;
/// Create a copy of UserRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserRequestModelCopyWith<UserRequestModel> get copyWith => _$UserRequestModelCopyWithImpl<UserRequestModel>(this as UserRequestModel, _$identity);

  /// Serializes this UserRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserRequestModel&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,deviceId,accessToken);

@override
String toString() {
  return 'UserRequestModel(deviceId: $deviceId, accessToken: $accessToken)';
}


}

/// @nodoc
abstract mixin class $UserRequestModelCopyWith<$Res>  {
  factory $UserRequestModelCopyWith(UserRequestModel value, $Res Function(UserRequestModel) _then) = _$UserRequestModelCopyWithImpl;
@useResult
$Res call({
 String deviceId, String accessToken
});




}
/// @nodoc
class _$UserRequestModelCopyWithImpl<$Res>
    implements $UserRequestModelCopyWith<$Res> {
  _$UserRequestModelCopyWithImpl(this._self, this._then);

  final UserRequestModel _self;
  final $Res Function(UserRequestModel) _then;

/// Create a copy of UserRequestModel
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
@JsonSerializable()

class _UserRequestModel implements UserRequestModel {
  const _UserRequestModel({required this.deviceId, required this.accessToken});
  factory _UserRequestModel.fromJson(Map<String, dynamic> json) => _$UserRequestModelFromJson(json);

@override final  String deviceId;
@override final  String accessToken;

/// Create a copy of UserRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserRequestModelCopyWith<_UserRequestModel> get copyWith => __$UserRequestModelCopyWithImpl<_UserRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserRequestModel&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,deviceId,accessToken);

@override
String toString() {
  return 'UserRequestModel(deviceId: $deviceId, accessToken: $accessToken)';
}


}

/// @nodoc
abstract mixin class _$UserRequestModelCopyWith<$Res> implements $UserRequestModelCopyWith<$Res> {
  factory _$UserRequestModelCopyWith(_UserRequestModel value, $Res Function(_UserRequestModel) _then) = __$UserRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String deviceId, String accessToken
});




}
/// @nodoc
class __$UserRequestModelCopyWithImpl<$Res>
    implements _$UserRequestModelCopyWith<$Res> {
  __$UserRequestModelCopyWithImpl(this._self, this._then);

  final _UserRequestModel _self;
  final $Res Function(_UserRequestModel) _then;

/// Create a copy of UserRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? deviceId = null,Object? accessToken = null,}) {
  return _then(_UserRequestModel(
deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
