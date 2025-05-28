// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'obscure_password_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ObscurePasswordState {

 bool get passwordObscure; bool get confirmObscure;
/// Create a copy of ObscurePasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ObscurePasswordStateCopyWith<ObscurePasswordState> get copyWith => _$ObscurePasswordStateCopyWithImpl<ObscurePasswordState>(this as ObscurePasswordState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ObscurePasswordState&&(identical(other.passwordObscure, passwordObscure) || other.passwordObscure == passwordObscure)&&(identical(other.confirmObscure, confirmObscure) || other.confirmObscure == confirmObscure));
}


@override
int get hashCode => Object.hash(runtimeType,passwordObscure,confirmObscure);

@override
String toString() {
  return 'ObscurePasswordState(passwordObscure: $passwordObscure, confirmObscure: $confirmObscure)';
}


}

/// @nodoc
abstract mixin class $ObscurePasswordStateCopyWith<$Res>  {
  factory $ObscurePasswordStateCopyWith(ObscurePasswordState value, $Res Function(ObscurePasswordState) _then) = _$ObscurePasswordStateCopyWithImpl;
@useResult
$Res call({
 bool passwordObscure, bool confirmObscure
});




}
/// @nodoc
class _$ObscurePasswordStateCopyWithImpl<$Res>
    implements $ObscurePasswordStateCopyWith<$Res> {
  _$ObscurePasswordStateCopyWithImpl(this._self, this._then);

  final ObscurePasswordState _self;
  final $Res Function(ObscurePasswordState) _then;

/// Create a copy of ObscurePasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? passwordObscure = null,Object? confirmObscure = null,}) {
  return _then(_self.copyWith(
passwordObscure: null == passwordObscure ? _self.passwordObscure : passwordObscure // ignore: cast_nullable_to_non_nullable
as bool,confirmObscure: null == confirmObscure ? _self.confirmObscure : confirmObscure // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class _ObscurePasswordState implements ObscurePasswordState {
  const _ObscurePasswordState({this.passwordObscure = true, this.confirmObscure = true});
  

@override@JsonKey() final  bool passwordObscure;
@override@JsonKey() final  bool confirmObscure;

/// Create a copy of ObscurePasswordState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ObscurePasswordStateCopyWith<_ObscurePasswordState> get copyWith => __$ObscurePasswordStateCopyWithImpl<_ObscurePasswordState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ObscurePasswordState&&(identical(other.passwordObscure, passwordObscure) || other.passwordObscure == passwordObscure)&&(identical(other.confirmObscure, confirmObscure) || other.confirmObscure == confirmObscure));
}


@override
int get hashCode => Object.hash(runtimeType,passwordObscure,confirmObscure);

@override
String toString() {
  return 'ObscurePasswordState(passwordObscure: $passwordObscure, confirmObscure: $confirmObscure)';
}


}

/// @nodoc
abstract mixin class _$ObscurePasswordStateCopyWith<$Res> implements $ObscurePasswordStateCopyWith<$Res> {
  factory _$ObscurePasswordStateCopyWith(_ObscurePasswordState value, $Res Function(_ObscurePasswordState) _then) = __$ObscurePasswordStateCopyWithImpl;
@override @useResult
$Res call({
 bool passwordObscure, bool confirmObscure
});




}
/// @nodoc
class __$ObscurePasswordStateCopyWithImpl<$Res>
    implements _$ObscurePasswordStateCopyWith<$Res> {
  __$ObscurePasswordStateCopyWithImpl(this._self, this._then);

  final _ObscurePasswordState _self;
  final $Res Function(_ObscurePasswordState) _then;

/// Create a copy of ObscurePasswordState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? passwordObscure = null,Object? confirmObscure = null,}) {
  return _then(_ObscurePasswordState(
passwordObscure: null == passwordObscure ? _self.passwordObscure : passwordObscure // ignore: cast_nullable_to_non_nullable
as bool,confirmObscure: null == confirmObscure ? _self.confirmObscure : confirmObscure // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
