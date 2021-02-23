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
            padding: EdgeInsets.only(
              top: Adapt.px(10),
              bottom: Adapt.px(20),
              left: Adapt.px(20),
              right: Adapt.px(20),
            ),
            child: TrailerApleeks(
              videoId: youtubeId,
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
