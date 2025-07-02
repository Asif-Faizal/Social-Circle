import 'package:get_it/get_it.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../feature/auth/bloc/logout/logout_bloc.dart';
import '../../feature/auth/bloc/register/register_bloc.dart';
import '../../feature/auth/bloc/sent_email_otp/sent_email_otp_bloc.dart';
import '../../feature/auth/bloc/verify_email_otp/verify_email_otp_bloc.dart';
import '../../feature/auth/cubit/otp/otp_cubit.dart';
import '../../feature/auth/data/datasources/auth_remote_data_source.dart';
import '../../feature/auth/data/repositories/auth_repository_impl.dart';
import '../../feature/auth/domain/repositories/auth_repository.dart';
import '../../feature/auth/domain/usecases/check_email.usecase.dart';
import '../../feature/auth/domain/usecases/login.usecase.dart';
import '../../feature/auth/bloc/check_email/check_email_bloc.dart';
import '../../feature/auth/bloc/login/login_bloc.dart';
import '../../feature/auth/domain/usecases/logout.usecase.dart';
import '../../feature/auth/domain/usecases/register.usecase.dart';
import '../../feature/auth/domain/usecases/sent_email_otp.usecase.dart';
import '../../feature/auth/domain/usecases/verify_email_otp.usecase.dart';
import '../../feature/home/bloc/user_details/user_details_bloc.dart';
import '../../feature/home/bloc/all_users/all_users_bloc.dart';
import '../../feature/home/data/user.datasource.dart';
import '../../feature/home/data/user.repo.impl.dart';
import '../../feature/home/domain/usecases/user.details.dart';
import '../../feature/home/domain/usecases/get_all_users.usecase.dart';
import '../../feature/home/domain/user.repo.dart';
import '../../feature/splash/cubit/deviceInfo/device_info_cubit.dart';
import '../../feature/splash/cubit/splash/splash_cubit.dart';
import '../storage/storage_helper.dart';
import '../network/network_info.dart';
import 'package:grpc/grpc.dart';
import '../../feature/chat/bloc/chat_bloc.dart';
import '../../feature/chat/data/datasources/chat_remote_data_source.dart';
import '../../feature/chat/data/repositories/chat_repository_impl.dart';
import '../../feature/chat/domain/repositories/chat_repository.dart';
import '../../feature/chat/domain/usecases/converse_usecase.dart';
import '../../feature/chat/domain/usecases/get_chat_history_usecase.dart';

final GetIt sl = GetIt.instance;

class DependencyInjection {
  static Future<void> init() async {
    // Services
    sl.registerLazySingleton<StorageHelper>(() => StorageHelper());

    // Network Services
    sl.registerLazySingleton<Connectivity>(() => Connectivity());
    sl.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker.createInstance(),
    );
    sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectivity: sl(), connectionChecker: sl()),
    );

    // gRPC Client
    sl.registerLazySingleton<ClientChannel>(
      () => ClientChannel(
        'localhost',
        port: 5000,
        options: const ChannelOptions(
          credentials: ChannelCredentials.insecure(),
        ),
      ),
    );

    // Cubits
    sl.registerLazySingleton<DeviceInfoCubit>(
      () => DeviceInfoCubit(storageHelper: sl()),
    );
    sl.registerFactory<SplashCubit>(() => SplashCubit(deviceInfoCubit: sl()));
    sl.registerFactory<OtpCubit>(() => OtpCubit());

    // Auth
    sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(channel: sl(), networkInfo: sl()),
    );
    sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(remoteDataSource: sl()),
    );
    sl.registerLazySingleton(() => CheckEmailUseCase(sl()));
    sl.registerLazySingleton(() => LoginUseCase(sl()));
    sl.registerFactory(() => CheckEmailBloc(checkEmailUseCase: sl()));
    sl.registerFactory(
      () => LoginBloc(loginUseCase: sl(), storageHelper: sl()),
    );
    sl.registerFactory(
      () => SentEmailOtpBloc(sentEmailOtpUseCase: sl(), storageHelper: sl()),
    );
    sl.registerLazySingleton(() => SentEmailOtpUseCase(sl()));
    sl.registerFactory(
      () => VerifyEmailOtpBloc(verifyEmailOtpUseCase: sl(), storageHelper: sl()),
    );
    sl.registerLazySingleton(() => VerifyEmailOtpUseCase(sl()));
    sl.registerFactory(
      () => RegisterBloc(registerUseCase: sl(), storageHelper: sl()),
    );
    sl.registerLazySingleton(() => RegisterUseCase(sl()));
    sl.registerFactory(
      () => LogoutBloc(logoutUsecase: sl(), storageHelper: sl()),
    );
    sl.registerLazySingleton(() => LogoutUsecase(sl()));

    // Home
    sl.registerLazySingleton<UserDetailsRepo>(() => UserRepoImpl(userDataSource: sl()));
    sl.registerLazySingleton(() => UserDetailsUsecase(sl()));
    sl.registerLazySingleton(() => GetAllUsersUseCase(sl()));
    sl.registerFactory(
      () => UserDetailsBloc(userDetailsUsecase: sl(), storageHelper: sl()),
    );
    sl.registerFactory(
      () => AllUsersBloc(getAllUsersUseCase: sl(), storageHelper: sl()),
    );
    sl.registerLazySingleton<UserDataSource>(() => UserDataSourceImpl(channel: sl(), networkInfo: sl()));
  
    // Chat
    sl.registerLazySingleton<ChatRemoteDataSource>(
      () => ChatRemoteDataSourceImpl(channel: sl(), networkInfo: sl()),
    );
    sl.registerLazySingleton<ChatRepository>(
      () => ChatRepositoryImpl(remoteDataSource: sl()),
    );
    sl.registerLazySingleton(() => ConverseUseCase(sl()));
    sl.registerLazySingleton(() => GetChatHistoryUseCase(sl()));
    sl.registerFactory(
      () => ChatBloc(
        converseUseCase: sl(),
        getChatHistoryUseCase: sl(),
      ),
    );
  }
}
