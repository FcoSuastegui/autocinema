import 'package:autocinema/themes/size_config.dart';
import 'package:autocinema/themes/theme_style.dart';
import 'package:autocinema/widgets/Youtube/youtube_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TrailerApleeks extends StatelessWidget {
  final String videoId;

  const TrailerApleeks({
    @required this.videoId,
  });
  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = ThemeStyle.getTheme(context);
    return GestureDetector(
      onTap: () => ShowDialogApleeks.show(
        context,
        child: YoutubePlayer(
          streamLink: videoId,
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: getProportionateScreenWidth(180),
                  decoration: BoxDecoration(
                    color: _theme.primaryColorDark,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(
                        'https://i.ytimg.com/vi/$videoId/hqdefault.jpg',
                      ),
                    ),
                  ),
                ),
                Container(
                  height: getProportionateScreenWidth(180),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0x55000000),
                  ),
                  child: Icon(
                    Icons.play_circle_outline,
                    size: getProportionateScreenWidth(80),
                    color: const Color(0xFFFFFFFF),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ShowDialogApleeks extends StatelessWidget {
  final Widget child;

  static void show(
    BuildContext context, {
    Key key,
    Widget child,
  }) =>
      showGeneralDialog(
        barrierLabel: 'Trailer',
        barrierDismissible: true,
        barrierColor: Colors.black87,
        transitionDuration: Duration(milliseconds: 300),
        context: context,
        pageBuilder: (_, __, ___) {
          return ShowDialogApleeks(
            key: key,
            child: child,
          );
        },
      );

  ShowDialogApleeks({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        child: child,
      ),
    );
  }
}
