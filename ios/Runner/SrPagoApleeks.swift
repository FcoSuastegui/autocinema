//
//  SrPagoApleeks.swift
//  Runner
//
//  Created by Ing. Francisco Javier Suastegui Rosales 08/01/21.
//

import Foundation
import CoreLocation
import SrPago

class SrPagoApleeks : NSObject, CLLocationManagerDelegate {
    
    let manager: CLLocationManager = CLLocationManager()
    var flutterResult: FlutterResult?
    
    var srPago: SrPago?
    
    init(messenger: FlutterBinaryMessenger) {
       super.init()
       let channel = FlutterMethodChannel(name: "app.sr.pago.apleeks", binaryMessenger: messenger)
       channel.setMethodCallHandler(self.callHandler)
       self.manager.delegate = self
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("user action 😅")
        if self.flutterResult != nil {
            self.sendStatus(result: self.flutterResult!, status: status)
            self.flutterResult = nil
        }
    }
    
    private func callHandler(call:FlutterMethodCall, result:@escaping FlutterResult) {
        switch call.method {
        case "checkPermissions":
            checkPermissions(result: result)
        case "requestPermissions":
            requestPermissions(call: call, result: result)
        case "getToken":
            getToken(call: call, result: result)
        default:
                result(FlutterMethodNotImplemented)
        }
    }
    
    private func getToken(call:FlutterMethodCall, result:@escaping FlutterResult ) {
        
        let data: [String:Any] =  call.arguments  as! [String:Any]
        let card: [String:Any] =  data["card"] as! [String:Any]
        
        let srPago: SrPago = (SrPago.sharedInstance() as? SrPago)!
        srPago.publishableKey = (data["publicKey"] as? String)
        srPago.liveMode = data["liveMode"] as! Bool
        
        var resquest = ["status": false, "message":"", "token": ""] as [String : Any]
        
        let spCard = SPCard()
        
        spCard.name = card["name"] as? String
        spCard.number = card["number"] as? String
        spCard.expMonth = card["month"] as? String
        spCard.expYear = card["year"] as? String
        spCard.cvv = card["cvv"] as? String
        
        srPago.token.createToken(with: spCard, onSuccess: { (token) in
            if let token = token?.token {
                resquest["status"] = true
                resquest["token"] = token
                print("El Token es: \(token)")
                result(resquest)
            }
        }) { (error) in
           if let error = error?.message {
            resquest["message"] = error
            print("Hubo un error: \(String(describing: error))")
            result(resquest)
           }
        }
    }
    
    private func requestPermissions(call:FlutterMethodCall, result:@escaping FlutterResult ) {
        let args =  call.arguments as! [String:Any]
        let openAppSettings: Bool = args["openAppSettings"] as! Bool
        if self.flutterResult != nil {
            result(FlutterError(code: "PENDING_TASK", message: "You have a pending task", details: nil))
        } else {
            self.flutterResult = result
            if openAppSettings {
                print("open the app permission in Settings app")
                // open the app permission in Settings app
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
                }
            }else{
                self.manager.requestWhenInUseAuthorization()
            }
        }
    }
    
    private func checkPermissions(result:FlutterResult){
        let status:CLAuthorizationStatus =  CLLocationManager.authorizationStatus()
        self.sendStatus(result: result, status: status)
    }
    
    private func sendStatus(result: FlutterResult, status: CLAuthorizationStatus ){
        switch status {
        case .authorizedWhenInUse:
            print("granted")
            result("granted")
        case .denied:
            print("denied")
            result("denied")
        case .restricted:
            print("restricted")
            result("restricted")
        case .notDetermined:
            print("notDetermined")
            result("unknown")
        default:
            print("unknown")
            result("unknown");
        }
    }
    
}

