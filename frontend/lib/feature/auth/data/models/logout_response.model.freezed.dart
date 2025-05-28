// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logout_response.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LogoutResponseModel {

 bool get success; String get message;
/// Create a copy of LogoutResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogoutResponseModelCopyWith<LogoutResponseModel> get copyWith => _$LogoutResponseModelCopyWithImpl<LogoutResponseModel>(this as LogoutResponseModel, _$identity);

  /// Serializes this LogoutResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogoutResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message);

@override
String toString() {
  return 'LogoutResponseModel(success: $success, message: $message)';
}


}

/// @nodoc
abstract mixin class $LogoutResponseModelCopyWith<$Res>  {
  factory $LogoutResponseModelCopyWith(LogoutResponseModel value, $Res Function(LogoutResponseModel) _then) = _$LogoutResponseModelCopyWithImpl;
@useResult
$Res call({
 bool success, String message
});




}
/// @nodoc
class _$LogoutResponseModelCopyWithImpl<$Res>
    implements $LogoutResponseModelCopyWith<$Res> {
  _$LogoutResponseModelCopyWithImpl(this._self, this._then);

  final LogoutResponseModel _self;
  final $Res Function(LogoutResponseModel) _then;

/// Create a copy of LogoutResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _LogoutResponseModel extends LogoutResponseModel {
  const _LogoutResponseModel({required this.success, required this.message}): super._();
  factory _LogoutResponseModel.fromJson(Map<String, dynamic> json) => _$LogoutResponseModelFromJson(json);

@override final  bool success;
@override final  String message;

/// Create a copy of LogoutResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LogoutResponseModelCopyWith<_LogoutResponseModel> get copyWith => __$LogoutResponseModelCopyWithImpl<_LogoutResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LogoutResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogoutResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message);

@override
String toString() {
  return 'LogoutResponseModel(success: $success, message: $message)';
}


}

/// @nodoc
abstract mixin class _$LogoutResponseModelCopyWith<$Res> implements $LogoutResponseModelCopyWith<$Res> {
  factory _$LogoutResponseModelCopyWith(_LogoutResponseModel value, $Res Function(_LogoutResponseModel) _then) = __$LogoutResponseModelCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message
});




}
/// @nodoc
class __$LogoutResponseModelCopyWithImpl<$Res>
    implements _$LogoutResponseModelCopyWith<$Res> {
  __$LogoutResponseModelCopyWithImpl(this._self, this._then);

  final _LogoutResponseModel _self;
  final $Res Function(_LogoutResponseModel) _then;

/// Create a copy of LogoutResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,}) {
  return _then(_LogoutResponseModel(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
