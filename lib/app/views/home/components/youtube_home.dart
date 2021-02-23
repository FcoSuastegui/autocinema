import 'package:autocinema/app/themes/adapt.dart';
import 'package:autocinema/app/themes/theme_style.dart';
import 'package:autocinema/app/views/home/controller/home_controller.dart';
import 'package:autocinema/app/widgets/Trailers/trailer_apleeks.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class YouTubeHome extends GetView<HomeController> {
  const YouTubeHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
      ),
      child: Obx(
        () => TrailerApleeks(
          videoId: controller.stringKey.value,
        ),
      ),
    );
  }
}

class TrailerCell extends StatelessWidget {
  final String data;
  final Function onTap;
  const TrailerCell({
    @required this.data,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = ThemeStyle.getTheme(context);
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: Adapt.px(180),
                  decoration: BoxDecoration(
                    color: _theme.primaryColorDark,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(
                        'https://i.ytimg.com/vi/$data/hqdefault.jpg',
                      ),
                    ),
                  ),
                ),
                Container(
                  height: Adapt.px(180),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0x55000000),
                  ),
                  child: Icon(
                    Icons.play_circle_outline,
                    size: Adapt.px(80),
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
