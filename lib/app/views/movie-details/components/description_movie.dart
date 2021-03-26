import 'package:autocinema/app/themes/adapt.dart';
import 'package:autocinema/app/themes/theme_style.dart';
import 'package:autocinema/app/widgets/Text/expandable_text.dart';
import 'package:flutter/material.dart';

class DescriptionMovie extends StatelessWidget {
  final String description;
  final bool evento;
  const DescriptionMovie({
    Key key,
    this.description,
    this.evento = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = ThemeStyle.getTheme(context);
    return SliverToBoxAdapter(
      child: Container(
        color: _theme.cardColor,
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              evento ? "Detalles" : "Sipnosis",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: Adapt.px(30),
              ),
            ),
            SizedBox(
              height: Adapt.px(10),
            ),
            ExpandableText(
              description ?? '',
              maxLines: 5,
              style: TextStyle(
                color: const Color(0xFF717171),
                height: 1.5,
                fontSize: Adapt.px(25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
