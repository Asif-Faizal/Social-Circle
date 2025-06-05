import 'dart:developer';

import 'package:grpc/grpc.dart';

import '../../../core/error/failures.dart';
import '../../../core/network/network_info.dart';
import '../../auth/data/datasources/generated/user.pbgrpc.dart';
import '../domain/entities/user.entity.dart';
import 'models/user_request.model.dart';
import 'package:injectable/injectable.dart';

extension GetUserInfoResponseMapper on GetUserInfoResponse {
  UserEntity toEntity() {
    return UserEntity(
      success: success,
      message: message,
      id: user.id,
      name: user.username,
      email: user.email,
    );
  }
}

abstract class UserDataSource {
  Future<UserEntity> getUserDetails(UserRequestModel request);
}

@Injectable(as: UserDataSource)
class UserDataSourceImpl extends UserDataSource {
  final ClientChannel channel;
  final NetworkInfo networkInfo;
  late final UserServiceClient _client;

  UserDataSourceImpl({required this.channel, required this.networkInfo}) {
    _client = UserServiceClient(channel);
  }

  @override
  Future<UserEntity> getUserDetails(UserRequestModel requestModel) async {
    try {
      // Check network connectivity before making the request
      await networkInfo.checkConnectivity();

      final request = GetUserInfoRequest();

      // Add timeout to gRPC call
      final response = await _client
          .getUserInfo(
            request,
            options: CallOptions(
              timeout: const Duration(seconds: 10),
              metadata: {
                'authorization': 'Bearer ${requestModel.accessToken}',
              },
            ),
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
      return response.toEntity();
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
        throw Exception('Failed to get user details: ${e.toString()}');
      }
      throw const NetworkFailure('An unexpected network error occurred');
    }
  }
}