import 'package:autocinema/app/themes/adapt.dart';
import 'package:autocinema/app/themes/theme_style.dart';
import 'package:autocinema/app/widgets/Trailers/trailer_apleeks.dart';
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
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: TrailerApleeks(
              videoId: youtubeId,
              height: Adapt.px(500),
            ),
          ),
          SizedBox(
            height: Adapt.px(20),
          )
        ],
      ),
    );
  }
}
