import 'package:autocinema/app/globals/SrPago/permission.dart';

class SrPagoResponse {
  SrPagoResponse({
    this.status,
    this.message,
    this.token,
    this.type,
  });

  bool status;
  String message;
  PermissionStatus type;
  String token;

  factory SrPagoResponse.fromJson(Map<String, dynamic> json) => SrPagoResponse(
        status: json["status"],
        message: json["message"],
        type: json["type"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "type": type,
        "token": token,
      };
}
