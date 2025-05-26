import 'package:get_it/get_it.dart';
import '../../feature/auth/cubit/otp_cubit.dart';
import '../../feature/splash/cubit/deviceInfo/device_info_cubit.dart';
import '../../feature/splash/cubit/splash/splash_cubit.dart';

final GetIt sl = GetIt.instance;

class DependencyInjection {
  static Future<void> init() async {
    // Cubits
    sl.registerLazySingleton<DeviceInfoCubit>(() => DeviceInfoCubit());
    sl.registerFactory<SplashCubit>(() => SplashCubit(deviceInfoCubit: sl()));
    sl.registerFactory<OtpCubit>(() => OtpCubit());
  }
} 