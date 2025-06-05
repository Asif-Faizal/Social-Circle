//
//  Generated code. Do not modify.
//  source: user.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'user.pb.dart' as $0;

export 'user.pb.dart';

@$pb.GrpcServiceName('user.UserService')
class UserServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  static final _$register = $grpc.ClientMethod<$0.RegisterRequest, $0.RegisterResponse>(
      '/user.UserService/Register',
      ($0.RegisterRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RegisterResponse.fromBuffer(value));
  static final _$login = $grpc.ClientMethod<$0.LoginRequest, $0.LoginResponse>(
      '/user.UserService/Login',
      ($0.LoginRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.LoginResponse.fromBuffer(value));
  static final _$sendOTP = $grpc.ClientMethod<$0.SendOTPRequest, $0.SendOTPResponse>(
      '/user.UserService/SendOTP',
      ($0.SendOTPRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.SendOTPResponse.fromBuffer(value));
  static final _$verifyOTP = $grpc.ClientMethod<$0.VerifyOTPRequest, $0.VerifyOTPResponse>(
      '/user.UserService/VerifyOTP',
      ($0.VerifyOTPRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.VerifyOTPResponse.fromBuffer(value));
  static final _$getActiveSessions = $grpc.ClientMethod<$0.GetActiveSessionsRequest, $0.GetActiveSessionsResponse>(
      '/user.UserService/GetActiveSessions',
      ($0.GetActiveSessionsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetActiveSessionsResponse.fromBuffer(value));
  static final _$logoutDevice = $grpc.ClientMethod<$0.LogoutDeviceRequest, $0.LogoutDeviceResponse>(
      '/user.UserService/LogoutDevice',
      ($0.LogoutDeviceRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.LogoutDeviceResponse.fromBuffer(value));
  static final _$logoutAllDevices = $grpc.ClientMethod<$0.LogoutAllDevicesRequest, $0.LogoutAllDevicesResponse>(
      '/user.UserService/LogoutAllDevices',
      ($0.LogoutAllDevicesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.LogoutAllDevicesResponse.fromBuffer(value));
  static final _$refreshToken = $grpc.ClientMethod<$0.RefreshTokenRequest, $0.RefreshTokenResponse>(
      '/user.UserService/RefreshToken',
      ($0.RefreshTokenRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RefreshTokenResponse.fromBuffer(value));
  static final _$getUserInfo = $grpc.ClientMethod<$0.GetUserInfoRequest, $0.GetUserInfoResponse>(
      '/user.UserService/GetUserInfo',
      ($0.GetUserInfoRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetUserInfoResponse.fromBuffer(value));
  static final _$checkEmail = $grpc.ClientMethod<$0.CheckEmailRequest, $0.CheckEmailResponse>(
      '/user.UserService/CheckEmail',
      ($0.CheckEmailRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CheckEmailResponse.fromBuffer(value));

  UserServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.RegisterResponse> register($0.RegisterRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$register, request, options: options);
  }

  $grpc.ResponseFuture<$0.LoginResponse> login($0.LoginRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$login, request, options: options);
  }

  $grpc.ResponseFuture<$0.SendOTPResponse> sendOTP($0.SendOTPRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sendOTP, request, options: options);
  }

  $grpc.ResponseFuture<$0.VerifyOTPResponse> verifyOTP($0.VerifyOTPRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$verifyOTP, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetActiveSessionsResponse> getActiveSessions($0.GetActiveSessionsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getActiveSessions, request, options: options);
  }

  $grpc.ResponseFuture<$0.LogoutDeviceResponse> logoutDevice($0.LogoutDeviceRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$logoutDevice, request, options: options);
  }

  $grpc.ResponseFuture<$0.LogoutAllDevicesResponse> logoutAllDevices($0.LogoutAllDevicesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$logoutAllDevices, request, options: options);
  }

  $grpc.ResponseFuture<$0.RefreshTokenResponse> refreshToken($0.RefreshTokenRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$refreshToken, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetUserInfoResponse> getUserInfo($0.GetUserInfoRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUserInfo, request, options: options);
  }

  $grpc.ResponseFuture<$0.CheckEmailResponse> checkEmail($0.CheckEmailRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$checkEmail, request, options: options);
  }
}

@$pb.GrpcServiceName('user.UserService')
abstract class UserServiceBase extends $grpc.Service {
  $core.String get $name => 'user.UserService';

  UserServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.RegisterRequest, $0.RegisterResponse>(
        'Register',
        register_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RegisterRequest.fromBuffer(value),
        ($0.RegisterResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LoginRequest, $0.LoginResponse>(
        'Login',
        login_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LoginRequest.fromBuffer(value),
        ($0.LoginResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SendOTPRequest, $0.SendOTPResponse>(
        'SendOTP',
        sendOTP_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SendOTPRequest.fromBuffer(value),
        ($0.SendOTPResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.VerifyOTPRequest, $0.VerifyOTPResponse>(
        'VerifyOTP',
        verifyOTP_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.VerifyOTPRequest.fromBuffer(value),
        ($0.VerifyOTPResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetActiveSessionsRequest, $0.GetActiveSessionsResponse>(
        'GetActiveSessions',
        getActiveSessions_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetActiveSessionsRequest.fromBuffer(value),
        ($0.GetActiveSessionsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LogoutDeviceRequest, $0.LogoutDeviceResponse>(
        'LogoutDevice',
        logoutDevice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LogoutDeviceRequest.fromBuffer(value),
        ($0.LogoutDeviceResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LogoutAllDevicesRequest, $0.LogoutAllDevicesResponse>(
        'LogoutAllDevices',
        logoutAllDevices_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LogoutAllDevicesRequest.fromBuffer(value),
        ($0.LogoutAllDevicesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RefreshTokenRequest, $0.RefreshTokenResponse>(
        'RefreshToken',
        refreshToken_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RefreshTokenRequest.fromBuffer(value),
        ($0.RefreshTokenResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetUserInfoRequest, $0.GetUserInfoResponse>(
        'GetUserInfo',
        getUserInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetUserInfoRequest.fromBuffer(value),
        ($0.GetUserInfoResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CheckEmailRequest, $0.CheckEmailResponse>(
        'CheckEmail',
        checkEmail_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CheckEmailRequest.fromBuffer(value),
        ($0.CheckEmailResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.RegisterResponse> register_Pre($grpc.ServiceCall $call, $async.Future<$0.RegisterRequest> $request) async {
    return register($call, await $request);
  }

  $async.Future<$0.LoginResponse> login_Pre($grpc.ServiceCall $call, $async.Future<$0.LoginRequest> $request) async {
    return login($call, await $request);
  }

  $async.Future<$0.SendOTPResponse> sendOTP_Pre($grpc.ServiceCall $call, $async.Future<$0.SendOTPRequest> $request) async {
    return sendOTP($call, await $request);
  }

  $async.Future<$0.VerifyOTPResponse> verifyOTP_Pre($grpc.ServiceCall $call, $async.Future<$0.VerifyOTPRequest> $request) async {
    return verifyOTP($call, await $request);
  }

  $async.Future<$0.GetActiveSessionsResponse> getActiveSessions_Pre($grpc.ServiceCall $call, $async.Future<$0.GetActiveSessionsRequest> $request) async {
    return getActiveSessions($call, await $request);
  }

  $async.Future<$0.LogoutDeviceResponse> logoutDevice_Pre($grpc.ServiceCall $call, $async.Future<$0.LogoutDeviceRequest> $request) async {
    return logoutDevice($call, await $request);
  }

  $async.Future<$0.LogoutAllDevicesResponse> logoutAllDevices_Pre($grpc.ServiceCall $call, $async.Future<$0.LogoutAllDevicesRequest> $request) async {
    return logoutAllDevices($call, await $request);
  }

  $async.Future<$0.RefreshTokenResponse> refreshToken_Pre($grpc.ServiceCall $call, $async.Future<$0.RefreshTokenRequest> $request) async {
    return refreshToken($call, await $request);
  }

  $async.Future<$0.GetUserInfoResponse> getUserInfo_Pre($grpc.ServiceCall $call, $async.Future<$0.GetUserInfoRequest> $request) async {
    return getUserInfo($call, await $request);
  }

  $async.Future<$0.CheckEmailResponse> checkEmail_Pre($grpc.ServiceCall $call, $async.Future<$0.CheckEmailRequest> $request) async {
    return checkEmail($call, await $request);
  }

  $async.Future<$0.RegisterResponse> register($grpc.ServiceCall call, $0.RegisterRequest request);
  $async.Future<$0.LoginResponse> login($grpc.ServiceCall call, $0.LoginRequest request);
  $async.Future<$0.SendOTPResponse> sendOTP($grpc.ServiceCall call, $0.SendOTPRequest request);
  $async.Future<$0.VerifyOTPResponse> verifyOTP($grpc.ServiceCall call, $0.VerifyOTPRequest request);
  $async.Future<$0.GetActiveSessionsResponse> getActiveSessions($grpc.ServiceCall call, $0.GetActiveSessionsRequest request);
  $async.Future<$0.LogoutDeviceResponse> logoutDevice($grpc.ServiceCall call, $0.LogoutDeviceRequest request);
  $async.Future<$0.LogoutAllDevicesResponse> logoutAllDevices($grpc.ServiceCall call, $0.LogoutAllDevicesRequest request);
  $async.Future<$0.RefreshTokenResponse> refreshToken($grpc.ServiceCall call, $0.RefreshTokenRequest request);
  $async.Future<$0.GetUserInfoResponse> getUserInfo($grpc.ServiceCall call, $0.GetUserInfoRequest request);
  $async.Future<$0.CheckEmailResponse> checkEmail($grpc.ServiceCall call, $0.CheckEmailRequest request);
}
