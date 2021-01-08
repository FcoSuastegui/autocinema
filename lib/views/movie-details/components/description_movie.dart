import 'package:autocinema/themes/size_config.dart';
import 'package:autocinema/themes/theme_style.dart';
import 'package:autocinema/widgets/Text/expandable_text.dart';
import 'package:flutter/material.dart';

class DescriptionMovie extends StatelessWidget {
  final String description;
  const DescriptionMovie({
    Key key,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = ThemeStyle.getTheme(context);
    return SliverToBoxAdapter(
      child: Container(
        color: _theme.backgroundColor,
        padding: EdgeInsets.only(
          left: getProportionateScreenWidth(20),
          right: getProportionateScreenWidth(20),
          bottom: getProportionateScreenWidth(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: getProportionateScreenWidth(10),
            ),
            Text(
              "Descripción",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: getProportionateScreenWidth(16),
              ),
            ),
            SizedBox(
              height: getProportionateScreenWidth(10),
            ),
            ExpandableText(
              description ?? '',
              maxLines: 5,
              style: TextStyle(
                color: const Color(0xFF717171),
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
