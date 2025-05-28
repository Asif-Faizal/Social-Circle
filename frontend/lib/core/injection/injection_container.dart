import 'package:get_it/get_it.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../feature/auth/bloc/sent_email_otp/sent_email_otp_bloc.dart';
import '../../feature/auth/cubit/otp_cubit.dart';
import '../../feature/auth/data/datasources/auth_remote_data_source.dart';
import '../../feature/auth/data/repositories/auth_repository_impl.dart';
import '../../feature/auth/domain/repositories/auth_repository.dart';
import '../../feature/auth/domain/usecases/check_email.usecase.dart';
import '../../feature/auth/domain/usecases/login.usecase.dart';
import '../../feature/auth/bloc/check_email/check_email_bloc.dart';
import '../../feature/auth/bloc/login/login_bloc.dart';
import '../../feature/auth/domain/usecases/sent_email_otp.usecase.dart';
import '../../feature/splash/cubit/deviceInfo/device_info_cubit.dart';
import '../../feature/splash/cubit/splash/splash_cubit.dart';
import '../storage/storage_helper.dart';
import '../network/network_info.dart';
import 'package:grpc/grpc.dart';

final GetIt sl = GetIt.instance;

class DependencyInjection {
  static Future<void> init() async {
    // Services
    sl.registerLazySingleton<StorageHelper>(() => StorageHelper());

    // Network Services
    sl.registerLazySingleton<Connectivity>(() => Connectivity());
    sl.registerLazySingleton<InternetConnectionChecker>(() => InternetConnectionChecker.createInstance());
    sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(
        connectivity: sl(),
        connectionChecker: sl(),
      ),
    );

    // gRPC Client
    sl.registerLazySingleton<ClientChannel>(() => ClientChannel(
          'localhost',
          port: 5000,
          options: const ChannelOptions(
            credentials: ChannelCredentials.insecure(),
          ),
        ));

    // Cubits
    sl.registerLazySingleton<DeviceInfoCubit>(
      () => DeviceInfoCubit(storageHelper: sl()),
    );
    sl.registerFactory<SplashCubit>(() => SplashCubit(deviceInfoCubit: sl()));
    sl.registerFactory<OtpCubit>(() => OtpCubit());

    // Auth
    sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        channel: sl(),
        networkInfo: sl(),
      ),
    );
    sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(remoteDataSource: sl()),
    );
    sl.registerLazySingleton(() => CheckEmailUseCase(sl()));
    sl.registerLazySingleton(() => LoginUseCase(sl()));
    sl.registerFactory(() => CheckEmailBloc(checkEmailUseCase: sl()));
    sl.registerFactory(() => LoginBloc(loginUseCase: sl(), storageHelper: sl()));
    sl.registerFactory(() => SentEmailOtpBloc(sentEmailOtpUseCase: sl()));
    sl.registerLazySingleton(() => SentEmailOtpUseCase(sl()));
  }
}
