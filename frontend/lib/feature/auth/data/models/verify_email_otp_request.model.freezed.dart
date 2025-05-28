// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_email_otp_request.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VerifyEmailOtpRequestModel {

 String get email; String get otp; String get deviceId; String get deviceOs;
/// Create a copy of VerifyEmailOtpRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyEmailOtpRequestModelCopyWith<VerifyEmailOtpRequestModel> get copyWith => _$VerifyEmailOtpRequestModelCopyWithImpl<VerifyEmailOtpRequestModel>(this as VerifyEmailOtpRequestModel, _$identity);

  /// Serializes this VerifyEmailOtpRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyEmailOtpRequestModel&&(identical(other.email, email) || other.email == email)&&(identical(other.otp, otp) || other.otp == otp)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.deviceOs, deviceOs) || other.deviceOs == deviceOs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,otp,deviceId,deviceOs);

@override
String toString() {
  return 'VerifyEmailOtpRequestModel(email: $email, otp: $otp, deviceId: $deviceId, deviceOs: $deviceOs)';
}


}

/// @nodoc
abstract mixin class $VerifyEmailOtpRequestModelCopyWith<$Res>  {
  factory $VerifyEmailOtpRequestModelCopyWith(VerifyEmailOtpRequestModel value, $Res Function(VerifyEmailOtpRequestModel) _then) = _$VerifyEmailOtpRequestModelCopyWithImpl;
@useResult
$Res call({
 String email, String otp, String deviceId, String deviceOs
});




}
/// @nodoc
class _$VerifyEmailOtpRequestModelCopyWithImpl<$Res>
    implements $VerifyEmailOtpRequestModelCopyWith<$Res> {
  _$VerifyEmailOtpRequestModelCopyWithImpl(this._self, this._then);

  final VerifyEmailOtpRequestModel _self;
  final $Res Function(VerifyEmailOtpRequestModel) _then;

/// Create a copy of VerifyEmailOtpRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? otp = null,Object? deviceId = null,Object? deviceOs = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,deviceOs: null == deviceOs ? _self.deviceOs : deviceOs // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _VerifyEmailOtpRequestModel implements VerifyEmailOtpRequestModel {
  const _VerifyEmailOtpRequestModel({required this.email, required this.otp, required this.deviceId, required this.deviceOs});
  factory _VerifyEmailOtpRequestModel.fromJson(Map<String, dynamic> json) => _$VerifyEmailOtpRequestModelFromJson(json);

@override final  String email;
@override final  String otp;
@override final  String deviceId;
@override final  String deviceOs;

/// Create a copy of VerifyEmailOtpRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyEmailOtpRequestModelCopyWith<_VerifyEmailOtpRequestModel> get copyWith => __$VerifyEmailOtpRequestModelCopyWithImpl<_VerifyEmailOtpRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VerifyEmailOtpRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyEmailOtpRequestModel&&(identical(other.email, email) || other.email == email)&&(identical(other.otp, otp) || other.otp == otp)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.deviceOs, deviceOs) || other.deviceOs == deviceOs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,otp,deviceId,deviceOs);

@override
String toString() {
  return 'VerifyEmailOtpRequestModel(email: $email, otp: $otp, deviceId: $deviceId, deviceOs: $deviceOs)';
}


}

/// @nodoc
abstract mixin class _$VerifyEmailOtpRequestModelCopyWith<$Res> implements $VerifyEmailOtpRequestModelCopyWith<$Res> {
  factory _$VerifyEmailOtpRequestModelCopyWith(_VerifyEmailOtpRequestModel value, $Res Function(_VerifyEmailOtpRequestModel) _then) = __$VerifyEmailOtpRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String email, String otp, String deviceId, String deviceOs
});




}
/// @nodoc
class __$VerifyEmailOtpRequestModelCopyWithImpl<$Res>
    implements _$VerifyEmailOtpRequestModelCopyWith<$Res> {
  __$VerifyEmailOtpRequestModelCopyWithImpl(this._self, this._then);

  final _VerifyEmailOtpRequestModel _self;
  final $Res Function(_VerifyEmailOtpRequestModel) _then;

/// Create a copy of VerifyEmailOtpRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? otp = null,Object? deviceId = null,Object? deviceOs = null,}) {
  return _then(_VerifyEmailOtpRequestModel(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,deviceOs: null == deviceOs ? _self.deviceOs : deviceOs // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
