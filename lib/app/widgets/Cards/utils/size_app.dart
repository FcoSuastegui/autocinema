import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class SizeAppCard {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double defaultSize;
  static Orientation orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

/*
 *   height es la altura que se desea obtner con base a la medida del dispositivo
 *   heightInit es la altura que el diseñador usa en el diseño
 * 
 */
double getSizeAppCardHeight({
  @required double height,
  double heightInit = 812.0,
}) {
  double screenHeight = SizeAppCard.screenHeight;
  return (height / heightInit) * screenHeight;
}

/*
 *   width es el ancho que se desea obtner con base a la medida del dispositivo
 *   widthInit es el ancho que el diseñador usa en el diseño
 * 
 */
double getSizeAppCardWidth({
  @required double width,
  double widthInit = 375.0,
}) {
  double screenWidth = SizeAppCard.screenWidth;
  return (width / widthInit) * screenWidth;
}
