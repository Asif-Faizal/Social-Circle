// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sent_email_otp_response.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SentEmailOtpResponseModel {

 bool get success; String get message;
/// Create a copy of SentEmailOtpResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SentEmailOtpResponseModelCopyWith<SentEmailOtpResponseModel> get copyWith => _$SentEmailOtpResponseModelCopyWithImpl<SentEmailOtpResponseModel>(this as SentEmailOtpResponseModel, _$identity);

  /// Serializes this SentEmailOtpResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SentEmailOtpResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message);

@override
String toString() {
  return 'SentEmailOtpResponseModel(success: $success, message: $message)';
}


}

/// @nodoc
abstract mixin class $SentEmailOtpResponseModelCopyWith<$Res>  {
  factory $SentEmailOtpResponseModelCopyWith(SentEmailOtpResponseModel value, $Res Function(SentEmailOtpResponseModel) _then) = _$SentEmailOtpResponseModelCopyWithImpl;
@useResult
$Res call({
 bool success, String message
});




}
/// @nodoc
class _$SentEmailOtpResponseModelCopyWithImpl<$Res>
    implements $SentEmailOtpResponseModelCopyWith<$Res> {
  _$SentEmailOtpResponseModelCopyWithImpl(this._self, this._then);

  final SentEmailOtpResponseModel _self;
  final $Res Function(SentEmailOtpResponseModel) _then;

/// Create a copy of SentEmailOtpResponseModel
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

class _SentEmailOtpResponseModel extends SentEmailOtpResponseModel {
  const _SentEmailOtpResponseModel({required this.success, required this.message}): super._();
  factory _SentEmailOtpResponseModel.fromJson(Map<String, dynamic> json) => _$SentEmailOtpResponseModelFromJson(json);

@override final  bool success;
@override final  String message;

/// Create a copy of SentEmailOtpResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SentEmailOtpResponseModelCopyWith<_SentEmailOtpResponseModel> get copyWith => __$SentEmailOtpResponseModelCopyWithImpl<_SentEmailOtpResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SentEmailOtpResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SentEmailOtpResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message);

@override
String toString() {
  return 'SentEmailOtpResponseModel(success: $success, message: $message)';
}


}

/// @nodoc
abstract mixin class _$SentEmailOtpResponseModelCopyWith<$Res> implements $SentEmailOtpResponseModelCopyWith<$Res> {
  factory _$SentEmailOtpResponseModelCopyWith(_SentEmailOtpResponseModel value, $Res Function(_SentEmailOtpResponseModel) _then) = __$SentEmailOtpResponseModelCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message
});




}
/// @nodoc
class __$SentEmailOtpResponseModelCopyWithImpl<$Res>
    implements _$SentEmailOtpResponseModelCopyWith<$Res> {
  __$SentEmailOtpResponseModelCopyWithImpl(this._self, this._then);

  final _SentEmailOtpResponseModel _self;
  final $Res Function(_SentEmailOtpResponseModel) _then;

/// Create a copy of SentEmailOtpResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,}) {
  return _then(_SentEmailOtpResponseModel(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
