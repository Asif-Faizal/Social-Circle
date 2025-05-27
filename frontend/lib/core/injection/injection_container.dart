import 'package:get_it/get_it.dart';
import '../../feature/auth/cubit/otp_cubit.dart';
import '../../feature/splash/cubit/deviceInfo/device_info_cubit.dart';
import '../../feature/splash/cubit/splash/splash_cubit.dart';
import '../storage/storage_helper.dart';

final GetIt sl = GetIt.instance;

class DependencyInjection {
  static Future<void> init() async {
    // Services
    sl.registerLazySingleton<StorageHelper>(() => StorageHelper());
    
    // Cubits
    sl.registerLazySingleton<DeviceInfoCubit>(() => DeviceInfoCubit(storageHelper: sl()));
    sl.registerFactory<SplashCubit>(() => SplashCubit(deviceInfoCubit: sl()));
    sl.registerFactory<OtpCubit>(() => OtpCubit());
  }
} 