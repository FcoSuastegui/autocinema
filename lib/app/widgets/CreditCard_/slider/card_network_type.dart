import 'package:flutter/material.dart';

class CardNetworkType {
  static CardNetworkType visa = CardNetworkType(
    Image.asset(
      'assets/images-card/visa.jpeg',
      height: 35,
    ),
  );

  static CardNetworkType mastercard = CardNetworkType(
    Image.asset(
      'assets/images-card/mastercard.png',
      height: 40,
    ),
  );

  static CardNetworkType visaBasic = CardNetworkType(
    Image.asset(
      'assets/images-card/visa_basic.png',
      height: 20,
    ),
  );

  static CardNetworkType rupay = CardNetworkType(
    Image.asset(
      'assets/images-card/rupay_logo.png',
      height: 40,
    ),
  );

  static CardNetworkType americanExpress = CardNetworkType(Image.asset(
    'assets/images-card/amex_logo.png',
    height: 50,
  ));

  static CardNetworkType discover = CardNetworkType(Image.asset(
    'assets/images-card/discover.png',
    height: 50,
  ));

  static CardNetworkType unionPay = CardNetworkType(Image.asset(
    'assets/images-card/union_pay.png',
    height: 50,
  ));

  final Widget widget;

  const CardNetworkType(this.widget);
}
