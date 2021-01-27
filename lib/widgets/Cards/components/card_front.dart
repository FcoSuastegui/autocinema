import 'package:autocinema/widgets/Cards/components/card_chip.dart';
import 'package:autocinema/widgets/Cards/utils/card_colors.dart';
import 'package:autocinema/widgets/Cards/utils/size_app.dart';
import 'package:flutter/material.dart';

class CardFront extends StatelessWidget {
  final int rotatedTurnsValue, cardColorIndexSelected;
  final String cardNumber, cardMonth, cardYear, cardHolderName, cardType, cardLogo;

  const CardFront({
    Key key,
    this.rotatedTurnsValue,
    this.cardColorIndexSelected = 0,
    this.cardNumber,
    this.cardMonth,
    this.cardYear,
    this.cardHolderName,
    this.cardType,
    this.cardLogo = "assets/visa_logo.png",
  });

  @override
  Widget build(BuildContext context) {
    final _cardNumber = Padding(
      padding: EdgeInsets.only(
        top: getSizeAppCardWidth(width: 10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          cardNumber != null && cardNumber.isNotEmpty
              ? _formatCardNumber(cardNumber)
              : _formatCardNumber('0000000000000000')
        ],
      ),
    );

    final _cardLastNumber = Padding(
      padding: EdgeInsets.only(
        top: getSizeAppCardWidth(width: 1),
        left: getSizeAppCardWidth(width: 40),
      ),
      child: Text(
        cardNumber != null && cardNumber.length >= 15
            ? cardNumber.replaceAll(RegExp(r'\s+\b|\b\s'), '').substring(12)
            : '0000',
        style: TextStyle(
          color: Colors.white,
          fontSize: getSizeAppCardWidth(width: 8),
        ),
      ),
    );

    final _cardValidThru = Padding(
      padding: EdgeInsets.only(
        top: getSizeAppCardWidth(width: 5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                'valid',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: getSizeAppCardWidth(width: 8),
                ),
              ),
              Text(
                'thru',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: getSizeAppCardWidth(width: 8),
                ),
              )
            ],
          ),
          SizedBox(
            width: getSizeAppCardWidth(width: 5),
          ),
          Text(
            cardMonth ?? '00',
            style: TextStyle(
              color: Colors.white,
              fontSize: getSizeAppCardWidth(width: 16),
            ),
          ),
          Text(
            cardYear != null && cardYear.length == 2 ? '/$cardYear' : '/00',
            style: TextStyle(
              color: Colors.white,
              fontSize: getSizeAppCardWidth(width: 16),
            ),
          ),
        ],
      ),
    );

    final _cardOwner = Padding(
      padding: EdgeInsets.only(
        top: getSizeAppCardWidth(width: 15),
        left: getSizeAppCardWidth(width: 20),
      ),
      child: Text(
        cardHolderName ?? 'CARDHOLDER NAME',
        style: TextStyle(
          color: Colors.white,
          fontSize: getSizeAppCardWidth(width: 15),
        ),
      ),
    );

    final _cardLogo = Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            top: getSizeAppCardWidth(width: 10),
            right: getSizeAppCardWidth(width: 30),
          ),
          child: Image.asset(
            cardLogo,
            width: getSizeAppCardWidth(width: 50),
            height: getSizeAppCardWidth(width: 30),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 30.0),
          child: Text(
            cardType ?? '',
            style: TextStyle(
              color: Colors.white,
              fontSize: getSizeAppCardWidth(width: 14),
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: CardColor.baseColors[cardColorIndexSelected],
      ),
      child: RotatedBox(
        quarterTurns: rotatedTurnsValue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _cardLogo,
            CardChip(),
            _cardNumber,
            _cardLastNumber,
            _cardValidThru,
            _cardOwner,
          ],
        ),
      ),
    );
  }
}

Widget _formatCardNumber(String cardNumber) {
  cardNumber = cardNumber.replaceAll(RegExp(r'\s+\b|\b\s'), '');
  List<Widget> numberList = new List<Widget>();
  var counter = 0;
  for (var i = 0; i < cardNumber.length; i++) {
    counter += 1;
    numberList.add(
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getSizeAppCardWidth(width: 1),
        ),
        child: Text(
          cardNumber[i],
          style: TextStyle(
            color: Colors.white,
            fontSize: getSizeAppCardWidth(width: 16),
          ),
        ),
      ),
    );
    if (counter == 4) {
      counter = 0;
      numberList.add(SizedBox(width: 26.0));
    }
  }
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: numberList,
  );
}
