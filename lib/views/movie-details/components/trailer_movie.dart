import 'package:autocinema/themes/size_config.dart';
import 'package:autocinema/themes/theme_style.dart';
import 'package:autocinema/widgets/Trailers/trailer_apleeks.dart';
import 'package:flutter/material.dart';

class TrailerMovie extends StatelessWidget {
  final String youtubeId;

  const TrailerMovie({
    Key key,
    this.youtubeId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = ThemeStyle.getTheme(context);
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Container(
            color: _theme.backgroundColor,
            padding: EdgeInsets.only(
              top: getProportionateScreenWidth(10),
              bottom: getProportionateScreenWidth(20),
              left: getProportionateScreenWidth(20),
              right: getProportionateScreenWidth(20),
            ),
            child: TrailerApleeks(
              videoId: youtubeId,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          )
        ],
      ),
    );
  }
}
