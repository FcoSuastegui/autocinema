import 'package:autocinema/app/widgets/Cards/utils/card_colors.dart';
import 'package:autocinema/app/widgets/Cards/utils/size_app.dart';
import 'package:flutter/material.dart';

class CardBack extends StatelessWidget {
  final int baseColors;
  final String cvv;

  const CardBack({
    Key key,
    this.baseColors,
    this.cvv,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: baseColors != null ? CardColor.baseColors[baseColors] : CardColor.baseColors[0],
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: getSizeAppCardWidth(width: 30),
            ),
            Row(
              children: <Widget>[
                Container(
                  child: Image.asset(
                    'assets/card_band.jpg',
                    width: getSizeAppCardWidth(width: 200),
                  ),
                ),
                SizedBox(
                  width: getSizeAppCardWidth(width: 15),
                ),
                Container(
                  width: getSizeAppCardWidth(width: 65),
                  height: getSizeAppCardWidth(width: 45),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    border: Border.all(color: Colors.red, width: 3.0),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      cvv ?? '',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: getSizeAppCardWidth(width: 25),
                left: getSizeAppCardWidth(width: 12.0),
              ),
              child: ClipRRect(
                borderRadius: new BorderRadius.circular(10.0),
                child: Image.asset(
                  'assets/card_back.jpg',
                  width: getSizeAppCardWidth(width: 65),
                  height: getSizeAppCardWidth(width: 40),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
