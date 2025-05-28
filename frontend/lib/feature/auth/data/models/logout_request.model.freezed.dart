// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logout_request.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LogoutRequestModel {

 String get userId; String get deviceId;
/// Create a copy of LogoutRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogoutRequestModelCopyWith<LogoutRequestModel> get copyWith => _$LogoutRequestModelCopyWithImpl<LogoutRequestModel>(this as LogoutRequestModel, _$identity);

  /// Serializes this LogoutRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogoutRequestModel&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,deviceId);

@override
String toString() {
  return 'LogoutRequestModel(userId: $userId, deviceId: $deviceId)';
}


}

/// @nodoc
abstract mixin class $LogoutRequestModelCopyWith<$Res>  {
  factory $LogoutRequestModelCopyWith(LogoutRequestModel value, $Res Function(LogoutRequestModel) _then) = _$LogoutRequestModelCopyWithImpl;
@useResult
$Res call({
 String userId, String deviceId
});




}
/// @nodoc
class _$LogoutRequestModelCopyWithImpl<$Res>
    implements $LogoutRequestModelCopyWith<$Res> {
  _$LogoutRequestModelCopyWithImpl(this._self, this._then);

  final LogoutRequestModel _self;
  final $Res Function(LogoutRequestModel) _then;

/// Create a copy of LogoutRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? deviceId = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _LogoutRequestModel implements LogoutRequestModel {
  const _LogoutRequestModel({required this.userId, required this.deviceId});
  factory _LogoutRequestModel.fromJson(Map<String, dynamic> json) => _$LogoutRequestModelFromJson(json);

@override final  String userId;
@override final  String deviceId;

/// Create a copy of LogoutRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LogoutRequestModelCopyWith<_LogoutRequestModel> get copyWith => __$LogoutRequestModelCopyWithImpl<_LogoutRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LogoutRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogoutRequestModel&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,deviceId);

@override
String toString() {
  return 'LogoutRequestModel(userId: $userId, deviceId: $deviceId)';
}


}

/// @nodoc
abstract mixin class _$LogoutRequestModelCopyWith<$Res> implements $LogoutRequestModelCopyWith<$Res> {
  factory _$LogoutRequestModelCopyWith(_LogoutRequestModel value, $Res Function(_LogoutRequestModel) _then) = __$LogoutRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String userId, String deviceId
});




}
/// @nodoc
class __$LogoutRequestModelCopyWithImpl<$Res>
    implements _$LogoutRequestModelCopyWith<$Res> {
  __$LogoutRequestModelCopyWithImpl(this._self, this._then);

  final _LogoutRequestModel _self;
  final $Res Function(_LogoutRequestModel) _then;

/// Create a copy of LogoutRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? deviceId = null,}) {
  return _then(_LogoutRequestModel(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
