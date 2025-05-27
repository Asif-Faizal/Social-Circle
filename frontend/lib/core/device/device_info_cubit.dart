import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeviceInfoCubit extends Cubit<String> {
  static const platform = MethodChannel('com.socialcircle.app/device_info');
  
  DeviceInfoCubit() : super('');

  Future<String> getDeviceInfo() async {
    try {
      final result = await platform.invokeMethod<Map<Object?, Object?>>('getDeviceInfo');
      
      if (result == null) {
        throw Exception('Failed to get device info');
      }

      final deviceId = result['deviceId']?.toString() ?? '';
      emit(deviceId);
      return deviceId;
    } on PlatformException catch (e) {
      throw Exception(e.message ?? 'An error occurred');
    }
  }
} 