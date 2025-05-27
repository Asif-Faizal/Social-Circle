// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_email.entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CheckEmailEntity {

 bool get success; String get message; bool get isRegistered;
/// Create a copy of CheckEmailEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckEmailEntityCopyWith<CheckEmailEntity> get copyWith => _$CheckEmailEntityCopyWithImpl<CheckEmailEntity>(this as CheckEmailEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckEmailEntity&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.isRegistered, isRegistered) || other.isRegistered == isRegistered));
}


@override
int get hashCode => Object.hash(runtimeType,success,message,isRegistered);

@override
String toString() {
  return 'CheckEmailEntity(success: $success, message: $message, isRegistered: $isRegistered)';
}


}

/// @nodoc
abstract mixin class $CheckEmailEntityCopyWith<$Res>  {
  factory $CheckEmailEntityCopyWith(CheckEmailEntity value, $Res Function(CheckEmailEntity) _then) = _$CheckEmailEntityCopyWithImpl;
@useResult
$Res call({
 bool success, String message, bool isRegistered
});




}
/// @nodoc
class _$CheckEmailEntityCopyWithImpl<$Res>
    implements $CheckEmailEntityCopyWith<$Res> {
  _$CheckEmailEntityCopyWithImpl(this._self, this._then);

  final CheckEmailEntity _self;
  final $Res Function(CheckEmailEntity) _then;

/// Create a copy of CheckEmailEntity
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


class _CheckEmailEntity implements CheckEmailEntity {
  const _CheckEmailEntity({required this.success, required this.message, required this.isRegistered});
  

@override final  bool success;
@override final  String message;
@override final  bool isRegistered;

/// Create a copy of CheckEmailEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckEmailEntityCopyWith<_CheckEmailEntity> get copyWith => __$CheckEmailEntityCopyWithImpl<_CheckEmailEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckEmailEntity&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.isRegistered, isRegistered) || other.isRegistered == isRegistered));
}


@override
int get hashCode => Object.hash(runtimeType,success,message,isRegistered);

@override
String toString() {
  return 'CheckEmailEntity(success: $success, message: $message, isRegistered: $isRegistered)';
}


}

/// @nodoc
abstract mixin class _$CheckEmailEntityCopyWith<$Res> implements $CheckEmailEntityCopyWith<$Res> {
  factory _$CheckEmailEntityCopyWith(_CheckEmailEntity value, $Res Function(_CheckEmailEntity) _then) = __$CheckEmailEntityCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, bool isRegistered
});




}
/// @nodoc
class __$CheckEmailEntityCopyWithImpl<$Res>
    implements _$CheckEmailEntityCopyWith<$Res> {
  __$CheckEmailEntityCopyWithImpl(this._self, this._then);

  final _CheckEmailEntity _self;
  final $Res Function(_CheckEmailEntity) _then;

/// Create a copy of CheckEmailEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? isRegistered = null,}) {
  return _then(_CheckEmailEntity(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,isRegistered: null == isRegistered ? _self.isRegistered : isRegistered // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
