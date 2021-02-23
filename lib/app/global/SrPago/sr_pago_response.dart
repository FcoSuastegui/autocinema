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
