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
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Trailer",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: Adapt.px(30),
              ),
            ),
            SizedBox(
              height: Adapt.px(10),
            ),
            Container(
              color: _theme.backgroundColor,
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
      ),
    );
  }
}
