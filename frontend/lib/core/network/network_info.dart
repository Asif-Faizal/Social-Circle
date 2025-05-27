import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../error/failures.dart';

abstract class NetworkInfo {
  Future<void> checkConnectivity();
}

@Injectable(as: NetworkInfo)
class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectivity;
  final InternetConnectionChecker connectionChecker;

  NetworkInfoImpl({
    required this.connectivity,
    required this.connectionChecker,
  });

  @override
  Future<void> checkConnectivity() async {
    try {
      // Check basic connectivity
      final connectivityResult = await connectivity.checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        throw const NetworkFailure('No internet connection available');
      }

      // Check actual internet connection with timeout
      bool hasInternet = false;
      try {
        hasInternet = await connectionChecker.hasConnection.timeout(
          const Duration(seconds: 5),
          onTimeout: () => false,
        );
      } catch (e) {
        throw const NetworkFailure('Unable to verify network connection');
      }

      if (!hasInternet) {
        throw const NetworkFailure('Unable to reach the server. Please check your internet connection.');
      }

      // Check connection speed
      final stopwatch = Stopwatch()..start();
      try {
        await connectionChecker.hasConnection.timeout(
          const Duration(seconds: 10),
          onTimeout: () {
            throw const NetworkFailure('Network connection is too slow. Please try again with a better connection.');
          },
        );
      } finally {
        stopwatch.stop();
      }
    } catch (e) {
      if (e is NetworkFailure) {
        rethrow;
      }
      throw const NetworkFailure('Network connectivity check failed');
    }
  }
} 