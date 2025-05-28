// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_response.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RegisterResponseModel {

 bool get success; String get message;@JsonKey(name: 'access_token') String get accessToken;@JsonKey(name: 'refresh_token') String get refreshToken; NewUserModel get newUser;
/// Create a copy of RegisterResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterResponseModelCopyWith<RegisterResponseModel> get copyWith => _$RegisterResponseModelCopyWithImpl<RegisterResponseModel>(this as RegisterResponseModel, _$identity);

  /// Serializes this RegisterResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.newUser, newUser) || other.newUser == newUser));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,accessToken,refreshToken,newUser);

@override
String toString() {
  return 'RegisterResponseModel(success: $success, message: $message, accessToken: $accessToken, refreshToken: $refreshToken, newUser: $newUser)';
}


}

/// @nodoc
abstract mixin class $RegisterResponseModelCopyWith<$Res>  {
  factory $RegisterResponseModelCopyWith(RegisterResponseModel value, $Res Function(RegisterResponseModel) _then) = _$RegisterResponseModelCopyWithImpl;
@useResult
$Res call({
 bool success, String message,@JsonKey(name: 'access_token') String accessToken,@JsonKey(name: 'refresh_token') String refreshToken, NewUserModel newUser
});


$NewUserModelCopyWith<$Res> get newUser;

}
/// @nodoc
class _$RegisterResponseModelCopyWithImpl<$Res>
    implements $RegisterResponseModelCopyWith<$Res> {
  _$RegisterResponseModelCopyWithImpl(this._self, this._then);

  final RegisterResponseModel _self;
  final $Res Function(RegisterResponseModel) _then;

/// Create a copy of RegisterResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? accessToken = null,Object? refreshToken = null,Object? newUser = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,newUser: null == newUser ? _self.newUser : newUser // ignore: cast_nullable_to_non_nullable
as NewUserModel,
  ));
}
/// Create a copy of RegisterResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NewUserModelCopyWith<$Res> get newUser {
  
  return $NewUserModelCopyWith<$Res>(_self.newUser, (value) {
    return _then(_self.copyWith(newUser: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _RegisterResponseModel extends RegisterResponseModel {
  const _RegisterResponseModel({required this.success, required this.message, @JsonKey(name: 'access_token') required this.accessToken, @JsonKey(name: 'refresh_token') required this.refreshToken, required this.newUser}): super._();
  factory _RegisterResponseModel.fromJson(Map<String, dynamic> json) => _$RegisterResponseModelFromJson(json);

@override final  bool success;
@override final  String message;
@override@JsonKey(name: 'access_token') final  String accessToken;
@override@JsonKey(name: 'refresh_token') final  String refreshToken;
@override final  NewUserModel newUser;

/// Create a copy of RegisterResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterResponseModelCopyWith<_RegisterResponseModel> get copyWith => __$RegisterResponseModelCopyWithImpl<_RegisterResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegisterResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.newUser, newUser) || other.newUser == newUser));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,accessToken,refreshToken,newUser);

@override
String toString() {
  return 'RegisterResponseModel(success: $success, message: $message, accessToken: $accessToken, refreshToken: $refreshToken, newUser: $newUser)';
}


}

/// @nodoc
abstract mixin class _$RegisterResponseModelCopyWith<$Res> implements $RegisterResponseModelCopyWith<$Res> {
  factory _$RegisterResponseModelCopyWith(_RegisterResponseModel value, $Res Function(_RegisterResponseModel) _then) = __$RegisterResponseModelCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message,@JsonKey(name: 'access_token') String accessToken,@JsonKey(name: 'refresh_token') String refreshToken, NewUserModel newUser
});


@override $NewUserModelCopyWith<$Res> get newUser;

}
/// @nodoc
class __$RegisterResponseModelCopyWithImpl<$Res>
    implements _$RegisterResponseModelCopyWith<$Res> {
  __$RegisterResponseModelCopyWithImpl(this._self, this._then);

  final _RegisterResponseModel _self;
  final $Res Function(_RegisterResponseModel) _then;

/// Create a copy of RegisterResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? accessToken = null,Object? refreshToken = null,Object? newUser = null,}) {
  return _then(_RegisterResponseModel(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,newUser: null == newUser ? _self.newUser : newUser // ignore: cast_nullable_to_non_nullable
as NewUserModel,
  ));
}

/// Create a copy of RegisterResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NewUserModelCopyWith<$Res> get newUser {
  
  return $NewUserModelCopyWith<$Res>(_self.newUser, (value) {
    return _then(_self.copyWith(newUser: value));
  });
}
}


/// @nodoc
mixin _$NewUserModel {

 String get id; String get username; String get email;
/// Create a copy of NewUserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewUserModelCopyWith<NewUserModel> get copyWith => _$NewUserModelCopyWithImpl<NewUserModel>(this as NewUserModel, _$identity);

  /// Serializes this NewUserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewUserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,email);

@override
String toString() {
  return 'NewUserModel(id: $id, username: $username, email: $email)';
}


}

/// @nodoc
abstract mixin class $NewUserModelCopyWith<$Res>  {
  factory $NewUserModelCopyWith(NewUserModel value, $Res Function(NewUserModel) _then) = _$NewUserModelCopyWithImpl;
@useResult
$Res call({
 String id, String username, String email
});




}
/// @nodoc
class _$NewUserModelCopyWithImpl<$Res>
    implements $NewUserModelCopyWith<$Res> {
  _$NewUserModelCopyWithImpl(this._self, this._then);

  final NewUserModel _self;
  final $Res Function(NewUserModel) _then;

/// Create a copy of NewUserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? username = null,Object? email = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _NewUserModel extends NewUserModel {
  const _NewUserModel({required this.id, required this.username, required this.email}): super._();
  factory _NewUserModel.fromJson(Map<String, dynamic> json) => _$NewUserModelFromJson(json);

@override final  String id;
@override final  String username;
@override final  String email;

/// Create a copy of NewUserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewUserModelCopyWith<_NewUserModel> get copyWith => __$NewUserModelCopyWithImpl<_NewUserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NewUserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewUserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,email);

@override
String toString() {
  return 'NewUserModel(id: $id, username: $username, email: $email)';
}


}

/// @nodoc
abstract mixin class _$NewUserModelCopyWith<$Res> implements $NewUserModelCopyWith<$Res> {
  factory _$NewUserModelCopyWith(_NewUserModel value, $Res Function(_NewUserModel) _then) = __$NewUserModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String username, String email
});




}
/// @nodoc
class __$NewUserModelCopyWithImpl<$Res>
    implements _$NewUserModelCopyWith<$Res> {
  __$NewUserModelCopyWithImpl(this._self, this._then);

  final _NewUserModel _self;
  final $Res Function(_NewUserModel) _then;

/// Create a copy of NewUserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? username = null,Object? email = null,}) {
  return _then(_NewUserModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
