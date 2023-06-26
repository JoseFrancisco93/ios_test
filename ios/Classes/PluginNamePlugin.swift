import Flutter
import UIKit

import UIKit
import Flutter

public class PluginNamePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "plugin_name", binaryMessenger: registrar.messenger())
    let instance = PluginNamePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if call.method == "showAlert" {
      if let arguments = call.arguments as? [String: Any],
         let message = arguments["message"] as? String {
        showAlert(message: message)
        result(nil)
      } else {
        result(FlutterError(code: "INVALID_ARGUMENTS", message: "Invalid arguments", details: nil))
      }
    } else {
      result(FlutterMethodNotImplemented)
    }
  }

  private func showAlert(message: String) {
    let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    
    if let viewController = UIApplication.shared.keyWindow?.rootViewController {
      viewController.present(alertController, animated: true, completion: nil)
    }
  }
}
