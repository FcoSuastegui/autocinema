import 'package:autocinema/widgets/Cards/components/card_back.dart';
import 'package:autocinema/widgets/Cards/components/card_front.dart';
import 'package:autocinema/widgets/Cards/components/flip_card.dart';
import 'package:autocinema/widgets/Cards/utils/size_app.dart';
import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final GlobalKey<FlipCardState> animatedStateKey;
  final String cardHolderName, cardMonth, cardNumber, cardType, cardYear, cardCvv;
  final int rotatedTurnsValue, cardColorIndexSelected;
  const MyCard({
    Key key,
    @required this.animatedStateKey,
    this.cardColorIndexSelected = 0,
    this.cardType,
    this.cardHolderName,
    this.cardNumber,
    this.cardMonth,
    this.cardYear,
    this.cardCvv,
    this.rotatedTurnsValue = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeAppCard().init(context);
    return Card(
      color: Colors.grey[100],
      elevation: 0.0,
      child: FlipCard(
        key: animatedStateKey,
        front: CardFront(
          rotatedTurnsValue: 0,
          cardColorIndexSelected: cardColorIndexSelected,
          cardHolderName: cardHolderName,
          cardMonth: cardMonth,
          cardNumber: cardNumber,
          cardType: cardType,
          cardYear: cardYear,
        ),
        back: CardBack(
          baseColors: cardColorIndexSelected,
          cvv: cardCvv,
        ),
      ),
    );
  }
}
