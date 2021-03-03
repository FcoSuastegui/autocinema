import 'package:autocinema/app/themes/adapt.dart';
import 'package:flutter/material.dart';

class CardRefresh extends StatelessWidget {
  final Widget title;
  final Widget content;
  final double margin;

  const CardRefresh({
    Key key,
    this.title,
    this.margin = 300,
    this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: Adapt.px(margin),
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            title ?? SizedBox.shrink(),
            content ??
                Column(
                  children: [
                    Text("Tire para refrescar"),
                    Icon(Icons.arrow_downward),
                  ],
                ),
          ],
        ),
      ),
    );
  }
}
