// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register.entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RegisterEntity {

 bool get success; String get message; String get accessToken; String get refreshToken; NewUserEntity get newUser;
/// Create a copy of RegisterEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterEntityCopyWith<RegisterEntity> get copyWith => _$RegisterEntityCopyWithImpl<RegisterEntity>(this as RegisterEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterEntity&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.newUser, newUser) || other.newUser == newUser));
}


@override
int get hashCode => Object.hash(runtimeType,success,message,accessToken,refreshToken,newUser);

@override
String toString() {
  return 'RegisterEntity(success: $success, message: $message, accessToken: $accessToken, refreshToken: $refreshToken, newUser: $newUser)';
}


}

/// @nodoc
abstract mixin class $RegisterEntityCopyWith<$Res>  {
  factory $RegisterEntityCopyWith(RegisterEntity value, $Res Function(RegisterEntity) _then) = _$RegisterEntityCopyWithImpl;
@useResult
$Res call({
 bool success, String message, String accessToken, String refreshToken, NewUserEntity newUser
});


$NewUserEntityCopyWith<$Res> get newUser;

}
/// @nodoc
class _$RegisterEntityCopyWithImpl<$Res>
    implements $RegisterEntityCopyWith<$Res> {
  _$RegisterEntityCopyWithImpl(this._self, this._then);

  final RegisterEntity _self;
  final $Res Function(RegisterEntity) _then;

/// Create a copy of RegisterEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? accessToken = null,Object? refreshToken = null,Object? newUser = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,newUser: null == newUser ? _self.newUser : newUser // ignore: cast_nullable_to_non_nullable
as NewUserEntity,
  ));
}
/// Create a copy of RegisterEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NewUserEntityCopyWith<$Res> get newUser {
  
  return $NewUserEntityCopyWith<$Res>(_self.newUser, (value) {
    return _then(_self.copyWith(newUser: value));
  });
}
}


/// @nodoc


class _RegisterEntity implements RegisterEntity {
  const _RegisterEntity({required this.success, required this.message, required this.accessToken, required this.refreshToken, required this.newUser});
  

@override final  bool success;
@override final  String message;
@override final  String accessToken;
@override final  String refreshToken;
@override final  NewUserEntity newUser;

/// Create a copy of RegisterEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterEntityCopyWith<_RegisterEntity> get copyWith => __$RegisterEntityCopyWithImpl<_RegisterEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterEntity&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.newUser, newUser) || other.newUser == newUser));
}


@override
int get hashCode => Object.hash(runtimeType,success,message,accessToken,refreshToken,newUser);

@override
String toString() {
  return 'RegisterEntity(success: $success, message: $message, accessToken: $accessToken, refreshToken: $refreshToken, newUser: $newUser)';
}


}

/// @nodoc
abstract mixin class _$RegisterEntityCopyWith<$Res> implements $RegisterEntityCopyWith<$Res> {
  factory _$RegisterEntityCopyWith(_RegisterEntity value, $Res Function(_RegisterEntity) _then) = __$RegisterEntityCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, String accessToken, String refreshToken, NewUserEntity newUser
});


@override $NewUserEntityCopyWith<$Res> get newUser;

}
/// @nodoc
class __$RegisterEntityCopyWithImpl<$Res>
    implements _$RegisterEntityCopyWith<$Res> {
  __$RegisterEntityCopyWithImpl(this._self, this._then);

  final _RegisterEntity _self;
  final $Res Function(_RegisterEntity) _then;

/// Create a copy of RegisterEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? accessToken = null,Object? refreshToken = null,Object? newUser = null,}) {
  return _then(_RegisterEntity(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,newUser: null == newUser ? _self.newUser : newUser // ignore: cast_nullable_to_non_nullable
as NewUserEntity,
  ));
}

/// Create a copy of RegisterEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NewUserEntityCopyWith<$Res> get newUser {
  
  return $NewUserEntityCopyWith<$Res>(_self.newUser, (value) {
    return _then(_self.copyWith(newUser: value));
  });
}
}

/// @nodoc
mixin _$NewUserEntity {

 String get id; String get username; String get email;
/// Create a copy of NewUserEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewUserEntityCopyWith<NewUserEntity> get copyWith => _$NewUserEntityCopyWithImpl<NewUserEntity>(this as NewUserEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewUserEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,id,username,email);

@override
String toString() {
  return 'NewUserEntity(id: $id, username: $username, email: $email)';
}


}

/// @nodoc
abstract mixin class $NewUserEntityCopyWith<$Res>  {
  factory $NewUserEntityCopyWith(NewUserEntity value, $Res Function(NewUserEntity) _then) = _$NewUserEntityCopyWithImpl;
@useResult
$Res call({
 String id, String username, String email
});




}
/// @nodoc
class _$NewUserEntityCopyWithImpl<$Res>
    implements $NewUserEntityCopyWith<$Res> {
  _$NewUserEntityCopyWithImpl(this._self, this._then);

  final NewUserEntity _self;
  final $Res Function(NewUserEntity) _then;

/// Create a copy of NewUserEntity
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


class _NewUserEntity implements NewUserEntity {
  const _NewUserEntity({required this.id, required this.username, required this.email});
  

@override final  String id;
@override final  String username;
@override final  String email;

/// Create a copy of NewUserEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewUserEntityCopyWith<_NewUserEntity> get copyWith => __$NewUserEntityCopyWithImpl<_NewUserEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewUserEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,id,username,email);

@override
String toString() {
  return 'NewUserEntity(id: $id, username: $username, email: $email)';
}


}

/// @nodoc
abstract mixin class _$NewUserEntityCopyWith<$Res> implements $NewUserEntityCopyWith<$Res> {
  factory _$NewUserEntityCopyWith(_NewUserEntity value, $Res Function(_NewUserEntity) _then) = __$NewUserEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String username, String email
});




}
/// @nodoc
class __$NewUserEntityCopyWithImpl<$Res>
    implements _$NewUserEntityCopyWith<$Res> {
  __$NewUserEntityCopyWithImpl(this._self, this._then);

  final _NewUserEntity _self;
  final $Res Function(_NewUserEntity) _then;

/// Create a copy of NewUserEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? username = null,Object? email = null,}) {
  return _then(_NewUserEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
