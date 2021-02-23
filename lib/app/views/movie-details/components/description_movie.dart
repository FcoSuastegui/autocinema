import 'package:autocinema/app/themes/adapt.dart';
import 'package:autocinema/app/themes/theme_style.dart';
import 'package:autocinema/app/widgets/Text/expandable_text.dart';
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
          left: Adapt.px(20),
          right: Adapt.px(20),
          bottom: Adapt.px(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: Adapt.px(10),
            ),
            Text(
              "Descripción",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Adapt.px(16),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
