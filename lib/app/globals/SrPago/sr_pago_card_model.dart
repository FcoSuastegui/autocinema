import 'package:flutter/foundation.dart';

class SrPagoCardModel {
  SrPagoCardModel({
    @required this.name,
    @required this.number,
    @required this.cvv,
    @required this.month,
    @required this.year,
  });

  String name;
  String number;
  String cvv;
  String month;
  String year;

  factory SrPagoCardModel.fromJson(Map<String, dynamic> json) => SrPagoCardModel(
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
