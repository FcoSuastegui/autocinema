import 'package:autocinema/app/themes/adapt.dart';
import 'package:autocinema/app/themes/theme_style.dart';
import 'package:flutter/material.dart';

class FilterBar extends StatelessWidget {
  final String title;
  final Function onTap;
  const FilterBar({
    Key key,
    @required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = ThemeStyle.getTheme(context);
    return Container(
      color: _theme.canvasColor,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: Adapt.px(10),
              vertical: Adapt.px(5),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: Adapt.px(25),
              vertical: Adapt.px(5),
            ),
            height: Adapt.px(100),
            decoration: BoxDecoration(
              border: Border.all(
                color: _theme.brightness == Brightness.light
                    ? const Color(0xFFEFEFEF)
                    : const Color(0xFF505050),
              ),
              borderRadius: BorderRadius.circular(
                Adapt.px(10),
              ),
              color: _theme.cardColor,
            ),
            child: Row(
              children: [
                Text(
                  title ?? 'Titulo no disponible',
                ),
                Expanded(child: SizedBox()),
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.all(
                      Adapt.px(10),
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF334455),
                      borderRadius: BorderRadius.circular(
                        Adapt.px(8),
                      ),
                    ),
                    child: Icon(
                      Icons.filter_list,
                      size: Adapt.px(35),
                      color: const Color(0xFFFFFFFF),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
