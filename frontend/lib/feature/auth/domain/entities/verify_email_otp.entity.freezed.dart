// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_email_otp.entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VerifyEmailOtpEntity {

 bool get success; String get message;
/// Create a copy of VerifyEmailOtpEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyEmailOtpEntityCopyWith<VerifyEmailOtpEntity> get copyWith => _$VerifyEmailOtpEntityCopyWithImpl<VerifyEmailOtpEntity>(this as VerifyEmailOtpEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyEmailOtpEntity&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,success,message);

@override
String toString() {
  return 'VerifyEmailOtpEntity(success: $success, message: $message)';
}


}

/// @nodoc
abstract mixin class $VerifyEmailOtpEntityCopyWith<$Res>  {
  factory $VerifyEmailOtpEntityCopyWith(VerifyEmailOtpEntity value, $Res Function(VerifyEmailOtpEntity) _then) = _$VerifyEmailOtpEntityCopyWithImpl;
@useResult
$Res call({
 bool success, String message
});




}
/// @nodoc
class _$VerifyEmailOtpEntityCopyWithImpl<$Res>
    implements $VerifyEmailOtpEntityCopyWith<$Res> {
  _$VerifyEmailOtpEntityCopyWithImpl(this._self, this._then);

  final VerifyEmailOtpEntity _self;
  final $Res Function(VerifyEmailOtpEntity) _then;

/// Create a copy of VerifyEmailOtpEntity
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


class _VerifyEmailOtpEntity implements VerifyEmailOtpEntity {
  const _VerifyEmailOtpEntity({required this.success, required this.message});
  

@override final  bool success;
@override final  String message;

/// Create a copy of VerifyEmailOtpEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyEmailOtpEntityCopyWith<_VerifyEmailOtpEntity> get copyWith => __$VerifyEmailOtpEntityCopyWithImpl<_VerifyEmailOtpEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyEmailOtpEntity&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,success,message);

@override
String toString() {
  return 'VerifyEmailOtpEntity(success: $success, message: $message)';
}


}

/// @nodoc
abstract mixin class _$VerifyEmailOtpEntityCopyWith<$Res> implements $VerifyEmailOtpEntityCopyWith<$Res> {
  factory _$VerifyEmailOtpEntityCopyWith(_VerifyEmailOtpEntity value, $Res Function(_VerifyEmailOtpEntity) _then) = __$VerifyEmailOtpEntityCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message
});




}
/// @nodoc
class __$VerifyEmailOtpEntityCopyWithImpl<$Res>
    implements _$VerifyEmailOtpEntityCopyWith<$Res> {
  __$VerifyEmailOtpEntityCopyWithImpl(this._self, this._then);

  final _VerifyEmailOtpEntity _self;
  final $Res Function(_VerifyEmailOtpEntity) _then;

/// Create a copy of VerifyEmailOtpEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,}) {
  return _then(_VerifyEmailOtpEntity(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
