import 'package:autocinema/themes/size_config.dart';
import 'package:autocinema/themes/theme_style.dart';
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
              horizontal: getProportionateScreenWidth(10),
              vertical: getProportionateScreenWidth(5),
            ),
            padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenWidth(5),
              horizontal: getProportionateScreenWidth(10),
            ),
            height: getProportionateScreenWidth(50),
            decoration: BoxDecoration(
              border: Border.all(
                color: _theme.brightness == Brightness.light
                    ? const Color(0xFFEFEFEF)
                    : const Color(0xFF505050),
              ),
              borderRadius: BorderRadius.circular(
                getProportionateScreenWidth(8),
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
                      getProportionateScreenWidth(5),
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF334455),
                      borderRadius: BorderRadius.circular(
                        getProportionateScreenWidth(8),
                      ),
                    ),
                    child: Icon(
                      Icons.filter_list,
                      size: getProportionateScreenWidth(15),
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
