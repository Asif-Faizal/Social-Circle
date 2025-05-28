import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/storage/storage_helper.dart';
import 'device_info_state.dart';

class DeviceInfoCubit extends Cubit<DeviceInfoState> {
  static const platform = MethodChannel('com.socialcircle.app/device_info');
  final StorageHelper _storageHelper;
  
  DeviceInfoCubit({required StorageHelper storageHelper}) 
    : _storageHelper = storageHelper,
      super(const DeviceInfoState.initial());

  String _formatPlatformName(String platformName) {
    switch (platformName.toLowerCase()) {
      case 'ios':
        return 'iOS';
      case 'android':
        return 'Android';
      default:
        return platformName;
    }
  }

  Future<void> getDeviceInfo() async {
    try {
      emit(const DeviceInfoState.loading());
      
      final result = await platform.invokeMethod<Map<Object?, Object?>>('getDeviceInfo');
      
      if (result == null) {
        emit(const DeviceInfoState.error('Failed to get device info'));
        return;
      }

      final deviceId = result['deviceId']?.toString() ?? '';
      final osVersion = result['osVersion']?.toString() ?? '';
      final platformName = _formatPlatformName(result['platform']?.toString() ?? '');

      try {
         await _storageHelper.setDeviceInfo(
           deviceId: deviceId,
           deviceOs: platformName,
           deviceOsVersion: osVersion,
         );
      } catch (storageError) {
        emit(DeviceInfoState.error('Failed to store device info: $storageError'));
        return;
      }

      emit(DeviceInfoState.loaded(
        deviceId: deviceId,
        osVersion: osVersion,
        platform: platformName,
      ));
      
      debugPrint('Device ID from storage: ${_storageHelper.deviceId}');
    } on PlatformException catch (e) {
      emit(DeviceInfoState.error(e.message ?? 'An error occurred'));
    } catch (e) {
      debugPrint('Error while getting device info: $e');
      emit(DeviceInfoState.error(e.toString()));
    }
  }
} 