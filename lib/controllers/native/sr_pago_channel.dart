import 'package:flutter/services.dart';

enum PermissionStatus {
  unknown,
  granted,
  denied,
  restricted,
}

class SrPagoChannel {
  SrPagoChannel._internal();
  static SrPagoChannel _instance = SrPagoChannel._internal();
  static SrPagoChannel get i => _instance;
  PermissionStatus _status = PermissionStatus.unknown;

  MethodChannel _channel = MethodChannel('app.sr.pago.apleeks');

  String _publicKey;
  bool _liveMode = false;

  set liveMode(bool v) => _liveMode = v;
  set publicKey(String v) => _publicKey = v;

  Future<SrPagoResponse> getTokenSrPago(SrPagoCreditCard card) async {
    final SrPagoResponse response = SrPagoResponse(status: false, message: '');
    final PermissionStatus permission = await checkPermissions();

    if (permission == PermissionStatus.denied) {
      final p = await requestPermissions();
      if (p == PermissionStatus.denied) {
        response.message = "Es necesario aceptar el permiso de localización para realizar el pago";
        return response;
      }
    }

    if (permission == PermissionStatus.restricted) {
      final p = await requestPermissions();
      if (p == PermissionStatus.restricted) {
        response.message = "Es necesario aceptar el permiso de localización para realizar el pago";
        return response;
      }
    }

    if (_publicKey == null || _publicKey.isEmpty) {
      response.message = "Se necesita la llave pública de la aplicación SrPago";
      return response;
    }

    final Map<String, dynamic> arguments = {
      "liveMode": _liveMode,
      "publicKey": _publicKey,
      "creditCard": {
        "name": card.name,
        "number": card.number,
        "cvv": card.cvv,
        "month": card.month,
        "year": card.year,
      },
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

  Future<PermissionStatus> checkPermissions() async {
    final String result = await this._channel.invokeMethod<String>('checkPermissions');
    return this._getStatus(result);
  }

  Future<PermissionStatus> requestPermissions() async {
    final String result = await _channel.invokeMethod<String>("requestPermissions");
    return this._getStatus(result);
  }

  PermissionStatus _getStatus(String result) {
    switch (result) {
      case "granted":
        this._status = PermissionStatus.granted;
        break;
      case "denied":
        this._status = PermissionStatus.denied;
        break;
      case "restricted":
        this._status = PermissionStatus.restricted;
        break;
      default:
        this._status = PermissionStatus.unknown;
    }
    return this._status;
  }
}

class SrPagoResponse {
  SrPagoResponse({
    this.status,
    this.message,
    this.data,
  });

  bool status;
  String message;
  dynamic data;

  factory SrPagoResponse.fromJson(Map<String, dynamic> json) => SrPagoResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data,
      };
}

class SrPagoCreditCard {
  SrPagoCreditCard({
    this.name,
    this.number,
    this.cvv,
    this.month,
    this.year,
  });

  String name;
  String number;
  String cvv;
  String month;
  String year;

  factory SrPagoCreditCard.fromJson(Map<String, dynamic> json) => SrPagoCreditCard(
        name: json["name"],
        number: json["number"],
        cvv: json["cvv"],
        month: json["month"],
        year: json["year"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "number": number,
        "cvv": cvv,
        "month": month,
        "year": year,
      };
}
