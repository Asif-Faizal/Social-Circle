//
//  Generated code. Do not modify.
//  source: user.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use registerRequestDescriptor instead')
const RegisterRequest$json = {
  '1': 'RegisterRequest',
  '2': [
    {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    {'1': 'password', '3': 3, '4': 1, '5': 9, '10': 'password'},
    {'1': 'device_id', '3': 4, '4': 1, '5': 9, '10': 'deviceId'},
    {'1': 'device_os', '3': 5, '4': 1, '5': 9, '10': 'deviceOs'},
  ],
};

/// Descriptor for `RegisterRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerRequestDescriptor = $convert.base64Decode(
    'Cg9SZWdpc3RlclJlcXVlc3QSGgoIdXNlcm5hbWUYASABKAlSCHVzZXJuYW1lEhQKBWVtYWlsGA'
    'IgASgJUgVlbWFpbBIaCghwYXNzd29yZBgDIAEoCVIIcGFzc3dvcmQSGwoJZGV2aWNlX2lkGAQg'
    'ASgJUghkZXZpY2VJZBIbCglkZXZpY2Vfb3MYBSABKAlSCGRldmljZU9z');

@$core.Deprecated('Use registerResponseDescriptor instead')
const RegisterResponse$json = {
  '1': 'RegisterResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    {'1': 'access_token', '3': 3, '4': 1, '5': 9, '10': 'accessToken'},
    {'1': 'refresh_token', '3': 4, '4': 1, '5': 9, '10': 'refreshToken'},
    {'1': 'user', '3': 5, '4': 1, '5': 11, '6': '.user.User', '10': 'user'},
  ],
};

/// Descriptor for `RegisterResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerResponseDescriptor = $convert.base64Decode(
    'ChBSZWdpc3RlclJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSGAoHbWVzc2FnZR'
    'gCIAEoCVIHbWVzc2FnZRIhCgxhY2Nlc3NfdG9rZW4YAyABKAlSC2FjY2Vzc1Rva2VuEiMKDXJl'
    'ZnJlc2hfdG9rZW4YBCABKAlSDHJlZnJlc2hUb2tlbhIeCgR1c2VyGAUgASgLMgoudXNlci5Vc2'
    'VyUgR1c2Vy');

@$core.Deprecated('Use loginRequestDescriptor instead')
const LoginRequest$json = {
  '1': 'LoginRequest',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
    {'1': 'device_id', '3': 3, '4': 1, '5': 9, '10': 'deviceId'},
    {'1': 'device_os', '3': 4, '4': 1, '5': 9, '10': 'deviceOs'},
  ],
};

/// Descriptor for `LoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginRequestDescriptor = $convert.base64Decode(
    'CgxMb2dpblJlcXVlc3QSFAoFZW1haWwYASABKAlSBWVtYWlsEhoKCHBhc3N3b3JkGAIgASgJUg'
    'hwYXNzd29yZBIbCglkZXZpY2VfaWQYAyABKAlSCGRldmljZUlkEhsKCWRldmljZV9vcxgEIAEo'
    'CVIIZGV2aWNlT3M=');

@$core.Deprecated('Use loginResponseDescriptor instead')
const LoginResponse$json = {
  '1': 'LoginResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    {'1': 'access_token', '3': 3, '4': 1, '5': 9, '10': 'accessToken'},
    {'1': 'refresh_token', '3': 4, '4': 1, '5': 9, '10': 'refreshToken'},
    {'1': 'user', '3': 5, '4': 1, '5': 11, '6': '.user.User', '10': 'user'},
  ],
};

/// Descriptor for `LoginResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginResponseDescriptor = $convert.base64Decode(
    'Cg1Mb2dpblJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSGAoHbWVzc2FnZRgCIA'
    'EoCVIHbWVzc2FnZRIhCgxhY2Nlc3NfdG9rZW4YAyABKAlSC2FjY2Vzc1Rva2VuEiMKDXJlZnJl'
    'c2hfdG9rZW4YBCABKAlSDHJlZnJlc2hUb2tlbhIeCgR1c2VyGAUgASgLMgoudXNlci5Vc2VyUg'
    'R1c2Vy');

@$core.Deprecated('Use sendOTPRequestDescriptor instead')
const SendOTPRequest$json = {
  '1': 'SendOTPRequest',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    {'1': 'device_id', '3': 2, '4': 1, '5': 9, '10': 'deviceId'},
    {'1': 'device_os', '3': 3, '4': 1, '5': 9, '10': 'deviceOs'},
  ],
};

/// Descriptor for `SendOTPRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendOTPRequestDescriptor = $convert.base64Decode(
    'Cg5TZW5kT1RQUmVxdWVzdBIUCgVlbWFpbBgBIAEoCVIFZW1haWwSGwoJZGV2aWNlX2lkGAIgAS'
    'gJUghkZXZpY2VJZBIbCglkZXZpY2Vfb3MYAyABKAlSCGRldmljZU9z');

@$core.Deprecated('Use sendOTPResponseDescriptor instead')
const SendOTPResponse$json = {
  '1': 'SendOTPResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `SendOTPResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendOTPResponseDescriptor = $convert.base64Decode(
    'Cg9TZW5kT1RQUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIYCgdtZXNzYWdlGA'
    'IgASgJUgdtZXNzYWdl');

@$core.Deprecated('Use verifyOTPRequestDescriptor instead')
const VerifyOTPRequest$json = {
  '1': 'VerifyOTPRequest',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    {'1': 'otp', '3': 2, '4': 1, '5': 9, '10': 'otp'},
    {'1': 'device_id', '3': 3, '4': 1, '5': 9, '10': 'deviceId'},
    {'1': 'device_os', '3': 4, '4': 1, '5': 9, '10': 'deviceOs'},
  ],
};

/// Descriptor for `VerifyOTPRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyOTPRequestDescriptor = $convert.base64Decode(
    'ChBWZXJpZnlPVFBSZXF1ZXN0EhQKBWVtYWlsGAEgASgJUgVlbWFpbBIQCgNvdHAYAiABKAlSA2'
    '90cBIbCglkZXZpY2VfaWQYAyABKAlSCGRldmljZUlkEhsKCWRldmljZV9vcxgEIAEoCVIIZGV2'
    'aWNlT3M=');

@$core.Deprecated('Use verifyOTPResponseDescriptor instead')
const VerifyOTPResponse$json = {
  '1': 'VerifyOTPResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `VerifyOTPResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyOTPResponseDescriptor = $convert.base64Decode(
    'ChFWZXJpZnlPVFBSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEhgKB21lc3NhZ2'
    'UYAiABKAlSB21lc3NhZ2U=');

@$core.Deprecated('Use getActiveSessionsRequestDescriptor instead')
const GetActiveSessionsRequest$json = {
  '1': 'GetActiveSessionsRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `GetActiveSessionsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getActiveSessionsRequestDescriptor = $convert.base64Decode(
    'ChhHZXRBY3RpdmVTZXNzaW9uc1JlcXVlc3QSFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklk');

@$core.Deprecated('Use getActiveSessionsResponseDescriptor instead')
const GetActiveSessionsResponse$json = {
  '1': 'GetActiveSessionsResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    {'1': 'sessions', '3': 3, '4': 3, '5': 11, '6': '.user.DeviceSession', '10': 'sessions'},
  ],
};

/// Descriptor for `GetActiveSessionsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getActiveSessionsResponseDescriptor = $convert.base64Decode(
    'ChlHZXRBY3RpdmVTZXNzaW9uc1Jlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSGA'
    'oHbWVzc2FnZRgCIAEoCVIHbWVzc2FnZRIvCghzZXNzaW9ucxgDIAMoCzITLnVzZXIuRGV2aWNl'
    'U2Vzc2lvblIIc2Vzc2lvbnM=');

@$core.Deprecated('Use logoutDeviceRequestDescriptor instead')
const LogoutDeviceRequest$json = {
  '1': 'LogoutDeviceRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'device_id', '3': 2, '4': 1, '5': 9, '10': 'deviceId'},
  ],
};

/// Descriptor for `LogoutDeviceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List logoutDeviceRequestDescriptor = $convert.base64Decode(
    'ChNMb2dvdXREZXZpY2VSZXF1ZXN0EhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZBIbCglkZXZpY2'
    'VfaWQYAiABKAlSCGRldmljZUlk');

@$core.Deprecated('Use logoutDeviceResponseDescriptor instead')
const LogoutDeviceResponse$json = {
  '1': 'LogoutDeviceResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `LogoutDeviceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List logoutDeviceResponseDescriptor = $convert.base64Decode(
    'ChRMb2dvdXREZXZpY2VSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEhgKB21lc3'
    'NhZ2UYAiABKAlSB21lc3NhZ2U=');

@$core.Deprecated('Use logoutAllDevicesRequestDescriptor instead')
const LogoutAllDevicesRequest$json = {
  '1': 'LogoutAllDevicesRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `LogoutAllDevicesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List logoutAllDevicesRequestDescriptor = $convert.base64Decode(
    'ChdMb2dvdXRBbGxEZXZpY2VzUmVxdWVzdBIXCgd1c2VyX2lkGAEgASgJUgZ1c2VySWQ=');

@$core.Deprecated('Use logoutAllDevicesResponseDescriptor instead')
const LogoutAllDevicesResponse$json = {
  '1': 'LogoutAllDevicesResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    {'1': 'logged_out_count', '3': 3, '4': 1, '5': 5, '10': 'loggedOutCount'},
  ],
};

/// Descriptor for `LogoutAllDevicesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List logoutAllDevicesResponseDescriptor = $convert.base64Decode(
    'ChhMb2dvdXRBbGxEZXZpY2VzUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIYCg'
    'dtZXNzYWdlGAIgASgJUgdtZXNzYWdlEigKEGxvZ2dlZF9vdXRfY291bnQYAyABKAVSDmxvZ2dl'
    'ZE91dENvdW50');

@$core.Deprecated('Use refreshTokenRequestDescriptor instead')
const RefreshTokenRequest$json = {
  '1': 'RefreshTokenRequest',
  '2': [
    {'1': 'refresh_token', '3': 1, '4': 1, '5': 9, '10': 'refreshToken'},
    {'1': 'device_id', '3': 2, '4': 1, '5': 9, '10': 'deviceId'},
    {'1': 'device_os', '3': 3, '4': 1, '5': 9, '10': 'deviceOs'},
  ],
};

/// Descriptor for `RefreshTokenRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List refreshTokenRequestDescriptor = $convert.base64Decode(
    'ChNSZWZyZXNoVG9rZW5SZXF1ZXN0EiMKDXJlZnJlc2hfdG9rZW4YASABKAlSDHJlZnJlc2hUb2'
    'tlbhIbCglkZXZpY2VfaWQYAiABKAlSCGRldmljZUlkEhsKCWRldmljZV9vcxgDIAEoCVIIZGV2'
    'aWNlT3M=');

@$core.Deprecated('Use refreshTokenResponseDescriptor instead')
const RefreshTokenResponse$json = {
  '1': 'RefreshTokenResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    {'1': 'access_token', '3': 3, '4': 1, '5': 9, '10': 'accessToken'},
    {'1': 'refresh_token', '3': 4, '4': 1, '5': 9, '10': 'refreshToken'},
  ],
};

/// Descriptor for `RefreshTokenResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List refreshTokenResponseDescriptor = $convert.base64Decode(
    'ChRSZWZyZXNoVG9rZW5SZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEhgKB21lc3'
    'NhZ2UYAiABKAlSB21lc3NhZ2USIQoMYWNjZXNzX3Rva2VuGAMgASgJUgthY2Nlc3NUb2tlbhIj'
    'Cg1yZWZyZXNoX3Rva2VuGAQgASgJUgxyZWZyZXNoVG9rZW4=');

@$core.Deprecated('Use userDescriptor instead')
const User$json = {
  '1': 'User',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'username', '3': 2, '4': 1, '5': 9, '10': 'username'},
    {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
  ],
};

/// Descriptor for `User`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDescriptor = $convert.base64Decode(
    'CgRVc2VyEg4KAmlkGAEgASgJUgJpZBIaCgh1c2VybmFtZRgCIAEoCVIIdXNlcm5hbWUSFAoFZW'
    '1haWwYAyABKAlSBWVtYWls');

@$core.Deprecated('Use deviceSessionDescriptor instead')
const DeviceSession$json = {
  '1': 'DeviceSession',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'device_id', '3': 2, '4': 1, '5': 9, '10': 'deviceId'},
    {'1': 'device_os', '3': 3, '4': 1, '5': 9, '10': 'deviceOs'},
    {'1': 'last_activity', '3': 4, '4': 1, '5': 9, '10': 'lastActivity'},
    {'1': 'is_active', '3': 5, '4': 1, '5': 8, '10': 'isActive'},
  ],
};

/// Descriptor for `DeviceSession`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deviceSessionDescriptor = $convert.base64Decode(
    'Cg1EZXZpY2VTZXNzaW9uEg4KAmlkGAEgASgJUgJpZBIbCglkZXZpY2VfaWQYAiABKAlSCGRldm'
    'ljZUlkEhsKCWRldmljZV9vcxgDIAEoCVIIZGV2aWNlT3MSIwoNbGFzdF9hY3Rpdml0eRgEIAEo'
    'CVIMbGFzdEFjdGl2aXR5EhsKCWlzX2FjdGl2ZRgFIAEoCFIIaXNBY3RpdmU=');

@$core.Deprecated('Use checkEmailRequestDescriptor instead')
const CheckEmailRequest$json = {
  '1': 'CheckEmailRequest',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
  ],
};

/// Descriptor for `CheckEmailRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checkEmailRequestDescriptor = $convert.base64Decode(
    'ChFDaGVja0VtYWlsUmVxdWVzdBIUCgVlbWFpbBgBIAEoCVIFZW1haWw=');

@$core.Deprecated('Use checkEmailResponseDescriptor instead')
const CheckEmailResponse$json = {
  '1': 'CheckEmailResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    {'1': 'is_registered', '3': 3, '4': 1, '5': 8, '10': 'isRegistered'},
  ],
};

/// Descriptor for `CheckEmailResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checkEmailResponseDescriptor = $convert.base64Decode(
    'ChJDaGVja0VtYWlsUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIYCgdtZXNzYW'
    'dlGAIgASgJUgdtZXNzYWdlEiMKDWlzX3JlZ2lzdGVyZWQYAyABKAhSDGlzUmVnaXN0ZXJlZA==');

@$core.Deprecated('Use getUserInfoRequestDescriptor instead')
const GetUserInfoRequest$json = {
  '1': 'GetUserInfoRequest',
};

/// Descriptor for `GetUserInfoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserInfoRequestDescriptor = $convert.base64Decode(
    'ChJHZXRVc2VySW5mb1JlcXVlc3Q=');

@$core.Deprecated('Use getUserInfoResponseDescriptor instead')
const GetUserInfoResponse$json = {
  '1': 'GetUserInfoResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    {'1': 'user', '3': 3, '4': 1, '5': 11, '6': '.user.User', '10': 'user'},
  ],
};

/// Descriptor for `GetUserInfoResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserInfoResponseDescriptor = $convert.base64Decode(
    'ChNHZXRVc2VySW5mb1Jlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSGAoHbWVzc2'
    'FnZRgCIAEoCVIHbWVzc2FnZRIeCgR1c2VyGAMgASgLMgoudXNlci5Vc2VyUgR1c2Vy');

@$core.Deprecated('Use getAllUsersRequestDescriptor instead')
const GetAllUsersRequest$json = {
  '1': 'GetAllUsersRequest',
};

/// Descriptor for `GetAllUsersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAllUsersRequestDescriptor = $convert.base64Decode(
    'ChJHZXRBbGxVc2Vyc1JlcXVlc3Q=');

@$core.Deprecated('Use getAllUsersResponseDescriptor instead')
const GetAllUsersResponse$json = {
  '1': 'GetAllUsersResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    {'1': 'users', '3': 3, '4': 3, '5': 11, '6': '.user.User', '10': 'users'},
  ],
};

/// Descriptor for `GetAllUsersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAllUsersResponseDescriptor = $convert.base64Decode(
    'ChNHZXRBbGxVc2Vyc1Jlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSGAoHbWVzc2'
    'FnZRgCIAEoCVIHbWVzc2FnZRIgCgV1c2VycxgDIAMoCzIKLnVzZXIuVXNlclIFdXNlcnM=');

