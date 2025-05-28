// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logout.entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LogoutEntity {

 bool get success; String get message;
/// Create a copy of LogoutEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogoutEntityCopyWith<LogoutEntity> get copyWith => _$LogoutEntityCopyWithImpl<LogoutEntity>(this as LogoutEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogoutEntity&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,success,message);

@override
String toString() {
  return 'LogoutEntity(success: $success, message: $message)';
}


}

/// @nodoc
abstract mixin class $LogoutEntityCopyWith<$Res>  {
  factory $LogoutEntityCopyWith(LogoutEntity value, $Res Function(LogoutEntity) _then) = _$LogoutEntityCopyWithImpl;
@useResult
$Res call({
 bool success, String message
});




}
/// @nodoc
class _$LogoutEntityCopyWithImpl<$Res>
    implements $LogoutEntityCopyWith<$Res> {
  _$LogoutEntityCopyWithImpl(this._self, this._then);

  final LogoutEntity _self;
  final $Res Function(LogoutEntity) _then;

/// Create a copy of LogoutEntity
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


class _LogoutEntity implements LogoutEntity {
  const _LogoutEntity({required this.success, required this.message});
  

@override final  bool success;
@override final  String message;

/// Create a copy of LogoutEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LogoutEntityCopyWith<_LogoutEntity> get copyWith => __$LogoutEntityCopyWithImpl<_LogoutEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogoutEntity&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,success,message);

@override
String toString() {
  return 'LogoutEntity(success: $success, message: $message)';
}


}

/// @nodoc
abstract mixin class _$LogoutEntityCopyWith<$Res> implements $LogoutEntityCopyWith<$Res> {
  factory _$LogoutEntityCopyWith(_LogoutEntity value, $Res Function(_LogoutEntity) _then) = __$LogoutEntityCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message
});




}
/// @nodoc
class __$LogoutEntityCopyWithImpl<$Res>
    implements _$LogoutEntityCopyWith<$Res> {
  __$LogoutEntityCopyWithImpl(this._self, this._then);

  final _LogoutEntity _self;
  final $Res Function(_LogoutEntity) _then;

/// Create a copy of LogoutEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,}) {
  return _then(_LogoutEntity(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
