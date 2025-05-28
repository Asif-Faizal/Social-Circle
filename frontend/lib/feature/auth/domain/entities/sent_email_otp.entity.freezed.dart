// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sent_email_otp.entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SentEmailOtpEntity {

 bool get success; String get message;
/// Create a copy of SentEmailOtpEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SentEmailOtpEntityCopyWith<SentEmailOtpEntity> get copyWith => _$SentEmailOtpEntityCopyWithImpl<SentEmailOtpEntity>(this as SentEmailOtpEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SentEmailOtpEntity&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,success,message);

@override
String toString() {
  return 'SentEmailOtpEntity(success: $success, message: $message)';
}


}

/// @nodoc
abstract mixin class $SentEmailOtpEntityCopyWith<$Res>  {
  factory $SentEmailOtpEntityCopyWith(SentEmailOtpEntity value, $Res Function(SentEmailOtpEntity) _then) = _$SentEmailOtpEntityCopyWithImpl;
@useResult
$Res call({
 bool success, String message
});




}
/// @nodoc
class _$SentEmailOtpEntityCopyWithImpl<$Res>
    implements $SentEmailOtpEntityCopyWith<$Res> {
  _$SentEmailOtpEntityCopyWithImpl(this._self, this._then);

  final SentEmailOtpEntity _self;
  final $Res Function(SentEmailOtpEntity) _then;

/// Create a copy of SentEmailOtpEntity
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


class _SentEmailOtpEntity implements SentEmailOtpEntity {
  const _SentEmailOtpEntity({required this.success, required this.message});
  

@override final  bool success;
@override final  String message;

/// Create a copy of SentEmailOtpEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SentEmailOtpEntityCopyWith<_SentEmailOtpEntity> get copyWith => __$SentEmailOtpEntityCopyWithImpl<_SentEmailOtpEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SentEmailOtpEntity&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,success,message);

@override
String toString() {
  return 'SentEmailOtpEntity(success: $success, message: $message)';
}


}

/// @nodoc
abstract mixin class _$SentEmailOtpEntityCopyWith<$Res> implements $SentEmailOtpEntityCopyWith<$Res> {
  factory _$SentEmailOtpEntityCopyWith(_SentEmailOtpEntity value, $Res Function(_SentEmailOtpEntity) _then) = __$SentEmailOtpEntityCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message
});




}
/// @nodoc
class __$SentEmailOtpEntityCopyWithImpl<$Res>
    implements _$SentEmailOtpEntityCopyWith<$Res> {
  __$SentEmailOtpEntityCopyWithImpl(this._self, this._then);

  final _SentEmailOtpEntity _self;
  final $Res Function(_SentEmailOtpEntity) _then;

/// Create a copy of SentEmailOtpEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,}) {
  return _then(_SentEmailOtpEntity(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
