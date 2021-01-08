import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    var srPagoApleeks:SrPagoApleeks!
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
    let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
    // let methodChannel = FlutterMethodChannel(name: "app.sr.pago.apleeks", binaryMessenger: controller.binaryMessenger)
    
    self.srPagoApleeks =  SrPagoApleeks(messenger: controller.binaryMessenger)
    
    
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
