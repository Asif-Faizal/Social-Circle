import 'dart:developer';

import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import '../models/check_email_response.model.dart';
import '../models/login_request.model.dart';
import '../models/login_response.model.dart';
import '../models/logout_response.model.dart';
import '../models/register_request.model.dart';
import '../models/register_response.model.dart';
import '../models/sent_email_otp_request.model.dart';
import '../models/sent_email_otp_response.model.dart';
import '../models/verify_email_otp_request.model.dart';
import '../models/verify_email_otp_response.model.dart';
import 'generated/user.pbgrpc.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';

abstract class AuthRemoteDataSource {
  Future<CheckEmailResponseModel> checkEmail(String email);
  Future<LoginResponseModel> login(LoginRequestModel request);
  Future<SentEmailOtpResponseModel> sentEmailOtp(
      SentEmailOtpRequestModel request);
  Future<VerifyEmailOtpResponseModel> verifyEmailOtp(
      VerifyEmailOtpRequestModel request);
  Future<RegisterResponseModel> register(RegisterRequestModel request);
  Future<LogoutResponseModel> logout();
}

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ClientChannel channel;
  final NetworkInfo networkInfo;
  late final UserServiceClient _client;

  AuthRemoteDataSourceImpl({required this.channel, required this.networkInfo}) {
    _client = UserServiceClient(channel);
  }

  @override
  Future<CheckEmailResponseModel> checkEmail(String email) async {
    try {
      // Check network connectivity before making the request
      await networkInfo.checkConnectivity();

      final request = CheckEmailRequest()..email = email;

      // Add timeout to gRPC call
      final response = await _client
          .checkEmail(
            request,
            options: CallOptions(timeout: const Duration(seconds: 10)),
          )
          .timeout(
            const Duration(seconds: 15),
            onTimeout: () {
              throw const NetworkFailure(
                'Request timed out. Please check your connection and try again.',
              );
            },
          );
      log("========================================REQUEST============================================");
      log(request.toString());
      log("========================================RESPONSE===========================================");
      log(response.toString());
      return CheckEmailResponseModel(
        success: response.success,
        message: response.message,
        isRegistered: response.isRegistered,
      );
    } on NetworkFailure {
      rethrow;
    } on GrpcError catch (e) {
      switch (e.code) {
        case StatusCode.unavailable:
          throw const NetworkFailure(
            'Server is currently unavailable. Please try again later.',
          );
        case StatusCode.deadlineExceeded:
          throw const NetworkFailure(
            'Request took too long to complete. Please try again.',
          );
        default:
          throw Exception('gRPC Error: ${e.message}');
      }
    } catch (e) {
      if (e is Exception) {
        throw Exception('Failed to check email: ${e.toString()}');
      }
      throw const NetworkFailure('An unexpected network error occurred');
    }
  }

  @override
  Future<LoginResponseModel> login(LoginRequestModel request) async {
    try {
      // Check network connectivity before making the request
      await networkInfo.checkConnectivity();

      final loginRequest =
          LoginRequest()
            ..email = request.email
            ..password = request.password
            ..deviceId = request.deviceId
            ..deviceOs = request.deviceOs;

      // Add timeout to gRPC call
      final response = await _client
          .login(
            loginRequest,
            options: CallOptions(timeout: const Duration(seconds: 10)),
          )
          .timeout(
            const Duration(seconds: 15),
            onTimeout: () {
              throw const NetworkFailure(
                'Request timed out. Please check your connection and try again.',
              );
            },
          );
      log("========================================REQUEST============================================");
      log(loginRequest.toString());
      log("========================================RESPONSE===========================================");
      log(response.toString());
      return LoginResponseModel(
        success: response.success,
        message: response.message,
        accessToken: response.accessToken,
        refreshToken: response.refreshToken,
        user: UserModel(
          id: response.user.id,
          username: response.user.username,
          email: response.user.email,
        ),
      );
    } on NetworkFailure {
      rethrow;
    } on GrpcError catch (e) {
      switch (e.code) {
        case StatusCode.unavailable:
          throw const NetworkFailure(
            'Server is currently unavailable. Please try again later.',
          );
        case StatusCode.deadlineExceeded:
          throw const NetworkFailure(
            'Request took too long to complete. Please try again.',
          );
        case StatusCode.unauthenticated:
          throw const ServerFailure('Invalid email or password.');
        default:
          throw Exception('gRPC Error: ${e.message}');
      }
    } catch (e) {
      if (e is Exception) {
        throw Exception('Failed to login: ${e.toString()}');
      }
      throw const NetworkFailure('An unexpected network error occurred');
    }
  }

  @override
  Future<SentEmailOtpResponseModel> sentEmailOtp(
      SentEmailOtpRequestModel request) async {
    try {
      // Check network connectivity before making the request
      await networkInfo.checkConnectivity();

      final sendOtpRequest = SendOTPRequest()
        ..email = request.email
        ..deviceId = request.deviceId
        ..deviceOs = request.deviceOs;

      final response = await _client.sendOTP(
        sendOtpRequest,
        options: CallOptions(timeout: const Duration(seconds: 10)),
      );
      log("========================================REQUEST============================================");
      log(sendOtpRequest.toString());
      log("========================================RESPONSE===========================================");
      log(response.toString());
      return SentEmailOtpResponseModel(
        success: response.success,
        message: response.message,
      );
    } on NetworkFailure {
      rethrow;
    } on GrpcError catch (e) {
      switch (e.code) {
        case StatusCode.unavailable:
          throw const NetworkFailure(
            'Server is currently unavailable. Please try again later.',
          );
        case StatusCode.deadlineExceeded:
          throw const NetworkFailure(
            'Request took too long to complete. Please try again.',
          );
        default:
          throw Exception('gRPC Error: ${e.message}');
      }
    } catch (e) {
      if (e is Exception) {
        throw Exception('Failed to check email: ${e.toString()}');
      }
      throw const NetworkFailure('An unexpected network error occurred');
    }
  }

  @override
  Future<VerifyEmailOtpResponseModel> verifyEmailOtp(
      VerifyEmailOtpRequestModel request) async {
    try {
      // Check network connectivity before making the request
      await networkInfo.checkConnectivity();

      final verifyOtpRequest = VerifyOTPRequest()
        ..email = request.email
        ..otp = request.otp
        ..deviceId = request.deviceId
        ..deviceOs = request.deviceOs;

      final response = await _client.verifyOTP(
        verifyOtpRequest,
        options: CallOptions(timeout: const Duration(seconds: 10)),
      );
      log("========================================REQUEST============================================");
      log(verifyOtpRequest.toString());
      log("========================================RESPONSE===========================================");
      log(response.toString());
      return VerifyEmailOtpResponseModel(
        success: response.success,
        message: response.message,
      );
    } on NetworkFailure {
      rethrow;
    } on GrpcError catch (e) {
      switch (e.code) {
        case StatusCode.unavailable:
          throw const NetworkFailure(
            'Server is currently unavailable. Please try again later.',
          );
        case StatusCode.deadlineExceeded:
          throw const NetworkFailure(
            'Request took too long to complete. Please try again.',
          );
        default:
          throw Exception('gRPC Error: ${e.message}');
      }
    } catch (e) {
      if (e is Exception) {
        throw Exception('Failed to check email: ${e.toString()}');
      }
      throw const NetworkFailure('An unexpected network error occurred');
    }
  }

  @override
  Future<RegisterResponseModel> register(RegisterRequestModel request) async {
    try {
      // Check network connectivity before making the request
      await networkInfo.checkConnectivity();

      final registerRequest = RegisterRequest()
        ..username = request.name
        ..email = request.email
        ..password = request.password
        ..deviceId = request.deviceId
        ..deviceOs = request.deviceOs;

      final response = await _client.register(
        registerRequest,
        options: CallOptions(timeout: const Duration(seconds: 10)),
      );
      log("========================================REQUEST============================================");
      log(registerRequest.toString());
      log("========================================RESPONSE===========================================");
      log(response.toString());
      return RegisterResponseModel(
        success: response.success,
        message: response.message,
        accessToken: response.accessToken,
        refreshToken: response.refreshToken,
        newUser: NewUserModel(
          id: response.user.id,
          username: response.user.username,
          email: response.user.email,
        ),
      );
    } on NetworkFailure {
      rethrow;
    } on GrpcError catch (e) {
      switch (e.code) {
        case StatusCode.unavailable:
          throw const NetworkFailure(
            'Server is currently unavailable. Please try again later.',
          );
        case StatusCode.deadlineExceeded:
          throw const NetworkFailure(
            'Request took too long to complete. Please try again.',
          );
        default:
          throw Exception('gRPC Error: ${e.message}');
      }
    } catch (e) {
      if (e is Exception) {
        throw Exception('Failed to register: ${e.toString()}');
      }
      throw const NetworkFailure('An unexpected network error occurred');
    }
  }

  @override
  Future<LogoutResponseModel> logout() async {
    try {
      // Check network connectivity before making the request
      await networkInfo.checkConnectivity();

      final logoutRequest = LogoutDeviceRequest();

      final response = await _client.logoutDevice(logoutRequest);

      return LogoutResponseModel(
        success: response.success,
        message: response.message,
      );
    }  on NetworkFailure {
      rethrow;
    } on GrpcError catch (e) {
      switch (e.code) {
        case StatusCode.unavailable:
          throw const NetworkFailure(
            'Server is currently unavailable. Please try again later.',
          );
        case StatusCode.deadlineExceeded:
          throw const NetworkFailure(
            'Request took too long to complete. Please try again.',
          );
        default:
          throw Exception('gRPC Error: ${e.message}');
      }
    } catch (e) {
      if (e is Exception) {
        throw Exception('Failed to register: ${e.toString()}');
      }
      throw const NetworkFailure('An unexpected network error occurred');
    }
  }
}
