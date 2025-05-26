import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'device_info_state.dart';

class DeviceInfoCubit extends Cubit<DeviceInfoState> {
  static const platform = MethodChannel('com.socialcircle.app/device_info');
  
  DeviceInfoCubit() : super(const DeviceInfoState.initial());

  Future<void> getDeviceInfo() async {
    try {
      emit(const DeviceInfoState.loading());
      
      final result = await platform.invokeMethod<Map<Object?, Object?>>('getDeviceInfo');
      
      if (result == null) {
        emit(const DeviceInfoState.error('Failed to get device info'));
        return;
      }

      emit(DeviceInfoState.loaded(
        deviceId: result['deviceId']?.toString() ?? '',
        osVersion: result['osVersion']?.toString() ?? '',
        platform: result['platform']?.toString() ?? '',
      ));
    } on PlatformException catch (e) {
      emit(DeviceInfoState.error(e.message ?? 'An error occurred'));
    } catch (e) {
      emit(DeviceInfoState.error(e.toString()));
    }
  }
} 