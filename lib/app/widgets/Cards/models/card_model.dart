import 'dart:convert';
import 'dart:math';

import 'package:autocinema/app/widgets/Cards/utils/card_colors.dart';
import 'package:flutter/material.dart';

CardModel cardModelFromJson(String str) => CardModel.fromJson(json.decode(str));
String cardModelToJson(CardModel data) => json.encode(data.toJson());

class CardModel {
  CardModel({
    this.cardHolderName,
    this.cardNumber,
    this.cardMonth,
    this.cardYear,
    this.cardCvv,
    this.cardColor,
    this.cardType,
  });

  String cardHolderName;
  String cardNumber;
  String cardMonth;
  String cardYear;
  String cardCvv;
  dynamic cardColor;
  String cardType;

  factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
        cardHolderName: json["cardHolderName"],
        cardNumber: json["cardNumber"],
        cardMonth: json["cardMonth"],
        cardYear: json["cardYear"],
        cardCvv: json["cardCvv"],
        cardColor: json["cardColor"],
        cardType: json["cardType"],
      );

  Map<String, dynamic> toJson() => {
        "cardHolderName": cardHolderName,
        "cardNumber": cardNumber,
        "cardMonth": cardMonth,
        "cardYear": cardYear,
        "cardCvv": cardCvv,
        "cardColor": cardColor,
        "cardType": cardType,
      };
}

class CardService {
  Color randColor() {
    Random random = new Random();
    int randomNumber = random.nextInt(8) + 1;
    return CardColor.baseColors[randomNumber] ?? CardColor.baseColors[0];
  }

  Future<List<CardModel>> cards() async {
    final List<CardModel> cards = <CardModel>[
      CardModel(
        cardHolderName: "Francisco Javier",
        cardNumber: "5421143557869999",
        cardMonth: "11",
        cardYear: "2025",
        cardCvv: "127",
        cardColor: randColor(),
        cardType: "CREDIT",
      ),
      CardModel(
        cardHolderName: "Javier Suastegui",
        cardNumber: "5421143557869999",
        cardMonth: "11",
        cardYear: "2025",
        cardCvv: "127",
        cardColor: randColor(),
        cardType: "CREDIT",
      ),
      CardModel(
        cardHolderName: "Ana Ruth",
        cardNumber: "5421143557869999",
        cardMonth: "11",
        cardYear: "2025",
        cardCvv: "127",
        cardColor: randColor(),
        cardType: "CREDIT",
      ),
      CardModel(
        cardHolderName: "Ana Cervantes",
        cardNumber: "5421143557869999",
        cardMonth: "11",
        cardYear: "2025",
        cardCvv: "127",
        cardColor: randColor(),
        cardType: "CREDIT",
      ),
      CardModel(
        cardHolderName: "Francisco Salmeron",
        cardNumber: "5421143557869999",
        cardMonth: "11",
        cardYear: "2025",
        cardCvv: "127",
        cardColor: randColor(),
        cardType: "CREDIT",
      ),
      CardModel(
        cardHolderName: "Juan Miguel",
        cardNumber: "5421143557869999",
        cardMonth: "11",
        cardYear: "2025",
        cardCvv: "127",
        cardColor: randColor(),
        cardType: "CREDIT",
      ),
    ];

    return cards;
  }
}
