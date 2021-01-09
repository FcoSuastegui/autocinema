import 'package:flutter/foundation.dart';

class CardModel {
  CardModel({
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

  factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
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
