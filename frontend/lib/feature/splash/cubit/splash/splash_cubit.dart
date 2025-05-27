import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../deviceInfo/device_info_cubit.dart';
import 'splash_state.dart';
import 'package:flutter/foundation.dart';
class SplashCubit extends Cubit<SplashState> {
  final DeviceInfoCubit deviceInfoCubit;
  
  SplashCubit({required this.deviceInfoCubit}) : super(const SplashState.initial());

  Future<void> initializeApp() async {
    try {
      emit(const SplashState.loading());
      
      // Get device info
      await deviceInfoCubit.getDeviceInfo();
      debugPrint('Device info request completed');
      
      // Start timer after getting device ID
      await Future.delayed(const Duration(milliseconds: 1500));
      
      emit(const SplashState.navigateToNext());
    } catch (e) {
      emit(SplashState.error(e.toString()));
    }
  }
} 