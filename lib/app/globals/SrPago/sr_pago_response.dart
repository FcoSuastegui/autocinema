import 'package:autocinema/app/globals/SrPago/permission.dart';

class SrPagoResponse {
  SrPagoResponse({
    this.status,
    this.message,
    this.data,
    this.type,
  });

  bool status;
  String message;
  PermissionStatus type;
  dynamic data;

  factory SrPagoResponse.fromJson(Map<String, dynamic> json) => SrPagoResponse(
        status: json["status"],
        message: json["message"],
        type: json["type"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "type": type,
        "data": data,
      };
}
