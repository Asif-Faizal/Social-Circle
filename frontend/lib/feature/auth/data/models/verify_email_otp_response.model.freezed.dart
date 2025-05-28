// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_email_otp_response.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VerifyEmailOtpResponseModel {

 bool get success; String get message;
/// Create a copy of VerifyEmailOtpResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyEmailOtpResponseModelCopyWith<VerifyEmailOtpResponseModel> get copyWith => _$VerifyEmailOtpResponseModelCopyWithImpl<VerifyEmailOtpResponseModel>(this as VerifyEmailOtpResponseModel, _$identity);

  /// Serializes this VerifyEmailOtpResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyEmailOtpResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message);

@override
String toString() {
  return 'VerifyEmailOtpResponseModel(success: $success, message: $message)';
}


}

/// @nodoc
abstract mixin class $VerifyEmailOtpResponseModelCopyWith<$Res>  {
  factory $VerifyEmailOtpResponseModelCopyWith(VerifyEmailOtpResponseModel value, $Res Function(VerifyEmailOtpResponseModel) _then) = _$VerifyEmailOtpResponseModelCopyWithImpl;
@useResult
$Res call({
 bool success, String message
});




}
/// @nodoc
class _$VerifyEmailOtpResponseModelCopyWithImpl<$Res>
    implements $VerifyEmailOtpResponseModelCopyWith<$Res> {
  _$VerifyEmailOtpResponseModelCopyWithImpl(this._self, this._then);

  final VerifyEmailOtpResponseModel _self;
  final $Res Function(VerifyEmailOtpResponseModel) _then;

/// Create a copy of VerifyEmailOtpResponseModel
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

class _VerifyEmailOtpResponseModel extends VerifyEmailOtpResponseModel {
  const _VerifyEmailOtpResponseModel({required this.success, required this.message}): super._();
  factory _VerifyEmailOtpResponseModel.fromJson(Map<String, dynamic> json) => _$VerifyEmailOtpResponseModelFromJson(json);

@override final  bool success;
@override final  String message;

/// Create a copy of VerifyEmailOtpResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyEmailOtpResponseModelCopyWith<_VerifyEmailOtpResponseModel> get copyWith => __$VerifyEmailOtpResponseModelCopyWithImpl<_VerifyEmailOtpResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VerifyEmailOtpResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyEmailOtpResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message);

@override
String toString() {
  return 'VerifyEmailOtpResponseModel(success: $success, message: $message)';
}


}

/// @nodoc
abstract mixin class _$VerifyEmailOtpResponseModelCopyWith<$Res> implements $VerifyEmailOtpResponseModelCopyWith<$Res> {
  factory _$VerifyEmailOtpResponseModelCopyWith(_VerifyEmailOtpResponseModel value, $Res Function(_VerifyEmailOtpResponseModel) _then) = __$VerifyEmailOtpResponseModelCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message
});




}
/// @nodoc
class __$VerifyEmailOtpResponseModelCopyWithImpl<$Res>
    implements _$VerifyEmailOtpResponseModelCopyWith<$Res> {
  __$VerifyEmailOtpResponseModelCopyWithImpl(this._self, this._then);

  final _VerifyEmailOtpResponseModel _self;
  final $Res Function(_VerifyEmailOtpResponseModel) _then;

/// Create a copy of VerifyEmailOtpResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,}) {
  return _then(_VerifyEmailOtpResponseModel(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
