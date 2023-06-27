import UIKit
import Flutter
import UserNotifications

public class PluginNamePlugin: NSObject, FlutterPlugin {
    private var alertController: UIAlertController?
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "plugin_name", binaryMessenger: registrar.messenger())
        let instance = PluginNamePlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      if call.method == "getPlatformVersion" {
          result("iOS " + UIDevice.current.systemVersion)
      } else if call.method == "showAlert" {
          if let arguments = call.arguments as? [String: Any], let userName = arguments["userName"] as? String {
              DispatchQueue.main.async {
                  self.showSystemWindow(withUserName: userName)
              }
          }
      } else if call.method == "closeAlert" {
          DispatchQueue.main.async {
              self.closeSystemWindow()
          }
      }
}

    private func showSystemWindow(withUserName userName: String) {
        guard alertController == nil else {
            return
        }

        let alert = UIAlertController(title: nil, message: "Llamada con \(userName)", preferredStyle: .alert)
        alertController = alert

        // Apariencia
        let windowSubview = UIWindow(frame: UIScreen.main.bounds)
        let viewController = UIViewController()
        windowSubview.rootViewController = viewController
        windowSubview.windowLevel = UIWindow.Level.alert + 1
        windowSubview.isHidden = false

        viewController.present(alert, animated: true, completion: nil)
    }

    private func closeSystemWindow() {
        guard let alert = alertController else {
            return
        }

        alertController = nil
        alert.dismiss(animated: true, completion: nil)
    }
}