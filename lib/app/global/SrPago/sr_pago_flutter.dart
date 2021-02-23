import 'package:autocinema/app/global/SrPago/sr_pago_card_model.dart';
import 'package:autocinema/app/global/SrPago/permission.dart';
import 'package:autocinema/app/global/SrPago/sr_pago_response.dart';
import 'package:flutter/services.dart';

class SrPagoFlutter {
  static final SrPagoFlutter _instancia = new SrPagoFlutter._internal();
  factory SrPagoFlutter() => _instancia;
  SrPagoFlutter._internal();

  static PermissionStatus _status = PermissionStatus.unknown;
  static MethodChannel _channel = MethodChannel('app.sr.pago.apleeks');

  static String _publicKey;
  static bool _liveMode = false;

  static set liveMode(bool v) => _liveMode = v;
  static set publicKey(String v) => _publicKey = v;

  static Future<SrPagoResponse> createCardToken(SrPagoCardModel card) async {
    final SrPagoResponse response = SrPagoResponse(status: false, message: '');

    if (_publicKey == null || _publicKey.isEmpty) {
      response.message = "Se necesita la llave pública de la aplicación SrPago";
      return response;
    }

    final PermissionStatus permission = await _checkPermissions();

    if (permission == PermissionStatus.denied) {
      final p = await _requestPermissions();
      if (p == PermissionStatus.denied) {
        response.message = "Es necesario aceptar el permiso de localización para realizar el pago";
        return response;
      }
    }

    if (permission == PermissionStatus.restricted) {
      final p = await _requestPermissions();
      if (p == PermissionStatus.restricted) {
        response.message = "Es necesario aceptar el permiso de localización para realizar el pago";
        return response;
      }
    }

    if (permission == PermissionStatus.unknown) {
      final p = await _requestPermissions();
      if (p == PermissionStatus.restricted) {
        response.message = "Es necesario aceptar el permiso de localización para realizar el pago";
        return response;
      }
    }

    final Map<String, dynamic> arguments = {
      "liveMode": _liveMode,
      "publicKey": _publicKey,
      "card": card.toJson(),
    };

    final result = await _channel.invokeMethod("getToken", arguments);

    if (result['status']) {
      response.status = true;
      response.message = result['token'];
    } else {
      response.message = result['message'];
    }
    return response;
  }

  static Future<PermissionStatus> _checkPermissions() async {
    final String result = await _channel.invokeMethod<String>('checkPermissions');
    return _getStatus(result);
  }

  static Future<PermissionStatus> _requestPermissions() async {
    final String result = await _channel.invokeMethod<String>("requestPermissions", {
      "openAppSettings": _status == PermissionStatus.denied,
    });
    return _getStatus(result);
  }

  static PermissionStatus _getStatus(String result) {
    switch (result) {
      case "granted":
        _status = PermissionStatus.granted;
        break;
      case "denied":
        _status = PermissionStatus.denied;
        break;
      case "restricted":
        _status = PermissionStatus.restricted;
        break;
      default:
        _status = PermissionStatus.unknown;
    }
    return _status;
  }
}
