import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let deviceChannel = FlutterMethodChannel(name: "com.socialcircle.app/device_info",
                                           binaryMessenger: controller.binaryMessenger)
    
    deviceChannel.setMethodCallHandler({
      [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      switch call.method {
      case "getDeviceInfo":
        let deviceId = UIDevice.current.identifierForVendor?.uuidString ?? ""
        let osVersion = "iOS \(UIDevice.current.systemVersion)"
        let deviceInfo: [String: Any] = [
          "deviceId": deviceId,
          "osVersion": osVersion,
          "platform": "ios"
        ]
        result(deviceInfo)
      default:
        result(FlutterMethodNotImplemented)
      }
    })
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
