import 'package:autocinema/app/themes/adapt.dart';
import 'package:autocinema/app/themes/theme_style.dart';
import 'package:autocinema/app/widgets/Youtube/youtube_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TrailerApleeks extends StatelessWidget {
  final String videoId;
  final double height;

  const TrailerApleeks({
    @required this.videoId,
    this.height,
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
                CachedNetworkImage(
                  imageUrl: 'https://i.ytimg.com/vi/$videoId/hqdefault.jpg',
                  imageBuilder: (context, image) => Container(
                    height: Adapt.px(500),
                    decoration: BoxDecoration(
                      color: _theme.primaryColorDark,
                      image: DecorationImage(
                        image: image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFAABBCC),
                      image: DecorationImage(
                        image: Image.asset("assets/images/cargando-imagen.png").image,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    height: height ?? Adapt.px(800),
                    decoration: BoxDecoration(
                      color: const Color(0xFFAABBCC),
                      image: DecorationImage(
                        image: Image.asset("assets/images/imagen-no-disponible.png").image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  fadeOutDuration: const Duration(milliseconds: 400),
                  fadeInDuration: const Duration(milliseconds: 800),
                ),
                Container(
                  height: Adapt.px(500),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0x55000000),
                  ),
                  child: Icon(
                    Icons.play_circle_outline,
                    size: Adapt.px(120),
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
