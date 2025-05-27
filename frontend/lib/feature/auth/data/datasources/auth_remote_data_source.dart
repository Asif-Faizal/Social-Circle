import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import '../models/check_email_response.model.dart';
import 'generated/user.pbgrpc.dart';

abstract class AuthRemoteDataSource {
  Future<CheckEmailResponseModel> checkEmail(String email);
}

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ClientChannel channel;
  late final UserServiceClient _client;

  AuthRemoteDataSourceImpl({required this.channel}) {
    _client = UserServiceClient(channel);
  }

  @override
  Future<CheckEmailResponseModel> checkEmail(String email) async {
    try {
      final request = CheckEmailRequest()..email = email;
      final response = await _client.checkEmail(request);
      print(response);
      return CheckEmailResponseModel(
        success: response.success,
        message: response.message,
        isRegistered: response.isRegistered,
      );
    } catch (e) {
      throw Exception('Failed to check email: ${e.toString()}');
    }
  }
} 