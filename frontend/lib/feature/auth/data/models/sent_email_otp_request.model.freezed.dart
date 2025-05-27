// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sent_email_otp_request.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SentEmailOtpRequestModel {

 String get email;
/// Create a copy of SentEmailOtpRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SentEmailOtpRequestModelCopyWith<SentEmailOtpRequestModel> get copyWith => _$SentEmailOtpRequestModelCopyWithImpl<SentEmailOtpRequestModel>(this as SentEmailOtpRequestModel, _$identity);

  /// Serializes this SentEmailOtpRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SentEmailOtpRequestModel&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'SentEmailOtpRequestModel(email: $email)';
}


}

/// @nodoc
abstract mixin class $SentEmailOtpRequestModelCopyWith<$Res>  {
  factory $SentEmailOtpRequestModelCopyWith(SentEmailOtpRequestModel value, $Res Function(SentEmailOtpRequestModel) _then) = _$SentEmailOtpRequestModelCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$SentEmailOtpRequestModelCopyWithImpl<$Res>
    implements $SentEmailOtpRequestModelCopyWith<$Res> {
  _$SentEmailOtpRequestModelCopyWithImpl(this._self, this._then);

  final SentEmailOtpRequestModel _self;
  final $Res Function(SentEmailOtpRequestModel) _then;

/// Create a copy of SentEmailOtpRequestModel
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

class _SentEmailOtpRequestModel implements SentEmailOtpRequestModel {
  const _SentEmailOtpRequestModel({required this.email});
  factory _SentEmailOtpRequestModel.fromJson(Map<String, dynamic> json) => _$SentEmailOtpRequestModelFromJson(json);

@override final  String email;

/// Create a copy of SentEmailOtpRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SentEmailOtpRequestModelCopyWith<_SentEmailOtpRequestModel> get copyWith => __$SentEmailOtpRequestModelCopyWithImpl<_SentEmailOtpRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SentEmailOtpRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SentEmailOtpRequestModel&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'SentEmailOtpRequestModel(email: $email)';
}


}

/// @nodoc
abstract mixin class _$SentEmailOtpRequestModelCopyWith<$Res> implements $SentEmailOtpRequestModelCopyWith<$Res> {
  factory _$SentEmailOtpRequestModelCopyWith(_SentEmailOtpRequestModel value, $Res Function(_SentEmailOtpRequestModel) _then) = __$SentEmailOtpRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String email
});




}
/// @nodoc
class __$SentEmailOtpRequestModelCopyWithImpl<$Res>
    implements _$SentEmailOtpRequestModelCopyWith<$Res> {
  __$SentEmailOtpRequestModelCopyWithImpl(this._self, this._then);

  final _SentEmailOtpRequestModel _self;
  final $Res Function(_SentEmailOtpRequestModel) _then;

/// Create a copy of SentEmailOtpRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(_SentEmailOtpRequestModel(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
