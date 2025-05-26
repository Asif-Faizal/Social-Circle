package com.socialcircle.app

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.provider.Settings
import android.os.Build

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.socialcircle.app/device_info"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "getDeviceInfo" -> {
                    val deviceId = Settings.Secure.getString(contentResolver, Settings.Secure.ANDROID_ID)
                    val osVersion = "Android ${Build.VERSION.RELEASE}"
                    val deviceInfo = mapOf(
                        "deviceId" to deviceId,
                        "osVersion" to osVersion,
                        "platform" to "android"
                    )
                    result.success(deviceInfo)
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }
}
