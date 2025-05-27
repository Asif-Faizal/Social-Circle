// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_email_response.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CheckEmailResponseModel {

 bool get success; String get message;@JsonKey(name: 'is_registered') bool get isRegistered;
/// Create a copy of CheckEmailResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckEmailResponseModelCopyWith<CheckEmailResponseModel> get copyWith => _$CheckEmailResponseModelCopyWithImpl<CheckEmailResponseModel>(this as CheckEmailResponseModel, _$identity);

  /// Serializes this CheckEmailResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckEmailResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.isRegistered, isRegistered) || other.isRegistered == isRegistered));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,isRegistered);

@override
String toString() {
  return 'CheckEmailResponseModel(success: $success, message: $message, isRegistered: $isRegistered)';
}


}

/// @nodoc
abstract mixin class $CheckEmailResponseModelCopyWith<$Res>  {
  factory $CheckEmailResponseModelCopyWith(CheckEmailResponseModel value, $Res Function(CheckEmailResponseModel) _then) = _$CheckEmailResponseModelCopyWithImpl;
@useResult
$Res call({
 bool success, String message,@JsonKey(name: 'is_registered') bool isRegistered
});




}
/// @nodoc
class _$CheckEmailResponseModelCopyWithImpl<$Res>
    implements $CheckEmailResponseModelCopyWith<$Res> {
  _$CheckEmailResponseModelCopyWithImpl(this._self, this._then);

  final CheckEmailResponseModel _self;
  final $Res Function(CheckEmailResponseModel) _then;

/// Create a copy of CheckEmailResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? isRegistered = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,isRegistered: null == isRegistered ? _self.isRegistered : isRegistered // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _CheckEmailResponseModel extends CheckEmailResponseModel {
  const _CheckEmailResponseModel({required this.success, required this.message, @JsonKey(name: 'is_registered') required this.isRegistered}): super._();
  factory _CheckEmailResponseModel.fromJson(Map<String, dynamic> json) => _$CheckEmailResponseModelFromJson(json);

@override final  bool success;
@override final  String message;
@override@JsonKey(name: 'is_registered') final  bool isRegistered;

/// Create a copy of CheckEmailResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckEmailResponseModelCopyWith<_CheckEmailResponseModel> get copyWith => __$CheckEmailResponseModelCopyWithImpl<_CheckEmailResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckEmailResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckEmailResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.isRegistered, isRegistered) || other.isRegistered == isRegistered));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,isRegistered);

@override
String toString() {
  return 'CheckEmailResponseModel(success: $success, message: $message, isRegistered: $isRegistered)';
}


}

/// @nodoc
abstract mixin class _$CheckEmailResponseModelCopyWith<$Res> implements $CheckEmailResponseModelCopyWith<$Res> {
  factory _$CheckEmailResponseModelCopyWith(_CheckEmailResponseModel value, $Res Function(_CheckEmailResponseModel) _then) = __$CheckEmailResponseModelCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message,@JsonKey(name: 'is_registered') bool isRegistered
});




}
/// @nodoc
class __$CheckEmailResponseModelCopyWithImpl<$Res>
    implements _$CheckEmailResponseModelCopyWith<$Res> {
  __$CheckEmailResponseModelCopyWithImpl(this._self, this._then);

  final _CheckEmailResponseModel _self;
  final $Res Function(_CheckEmailResponseModel) _then;

/// Create a copy of CheckEmailResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? isRegistered = null,}) {
  return _then(_CheckEmailResponseModel(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,isRegistered: null == isRegistered ? _self.isRegistered : isRegistered // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
