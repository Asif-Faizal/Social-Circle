// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_email_request.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CheckEmailRequestModel {

 String get email;
/// Create a copy of CheckEmailRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckEmailRequestModelCopyWith<CheckEmailRequestModel> get copyWith => _$CheckEmailRequestModelCopyWithImpl<CheckEmailRequestModel>(this as CheckEmailRequestModel, _$identity);

  /// Serializes this CheckEmailRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckEmailRequestModel&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'CheckEmailRequestModel(email: $email)';
}


}

/// @nodoc
abstract mixin class $CheckEmailRequestModelCopyWith<$Res>  {
  factory $CheckEmailRequestModelCopyWith(CheckEmailRequestModel value, $Res Function(CheckEmailRequestModel) _then) = _$CheckEmailRequestModelCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$CheckEmailRequestModelCopyWithImpl<$Res>
    implements $CheckEmailRequestModelCopyWith<$Res> {
  _$CheckEmailRequestModelCopyWithImpl(this._self, this._then);

  final CheckEmailRequestModel _self;
  final $Res Function(CheckEmailRequestModel) _then;

/// Create a copy of CheckEmailRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _CheckEmailRequestModel implements CheckEmailRequestModel {
  const _CheckEmailRequestModel({required this.email});
  factory _CheckEmailRequestModel.fromJson(Map<String, dynamic> json) => _$CheckEmailRequestModelFromJson(json);

@override final  String email;

/// Create a copy of CheckEmailRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckEmailRequestModelCopyWith<_CheckEmailRequestModel> get copyWith => __$CheckEmailRequestModelCopyWithImpl<_CheckEmailRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckEmailRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckEmailRequestModel&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'CheckEmailRequestModel(email: $email)';
}


}

/// @nodoc
abstract mixin class _$CheckEmailRequestModelCopyWith<$Res> implements $CheckEmailRequestModelCopyWith<$Res> {
  factory _$CheckEmailRequestModelCopyWith(_CheckEmailRequestModel value, $Res Function(_CheckEmailRequestModel) _then) = __$CheckEmailRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String email
});




}
/// @nodoc
class __$CheckEmailRequestModelCopyWithImpl<$Res>
    implements _$CheckEmailRequestModelCopyWith<$Res> {
  __$CheckEmailRequestModelCopyWithImpl(this._self, this._then);

  final _CheckEmailRequestModel _self;
  final $Res Function(_CheckEmailRequestModel) _then;

/// Create a copy of CheckEmailRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(_CheckEmailRequestModel(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
