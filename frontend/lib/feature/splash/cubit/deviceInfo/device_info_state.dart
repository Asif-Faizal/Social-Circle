import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_info_state.freezed.dart';

@freezed
class DeviceInfoState with _$DeviceInfoState {
  const factory DeviceInfoState.initial() = _Initial;
  const factory DeviceInfoState.loading() = _Loading;
  const factory DeviceInfoState.loaded({
    required String deviceId,
    required String osVersion,
    required String platform,
  }) = _Loaded;
  const factory DeviceInfoState.error(String message) = _Error;
} 