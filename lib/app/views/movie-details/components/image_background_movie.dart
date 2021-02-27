import 'package:autocinema/app/themes/adapt.dart';
import 'package:autocinema/app/widgets/ScrollView/scrollview_background.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HeaderBackground extends StatefulWidget {
  final String imgUrl;
  final ScrollController scrollController;
  const HeaderBackground({
    this.imgUrl,
    this.scrollController,
  });
  @override
  HeaderBackgroundState createState() => HeaderBackgroundState();
}

class HeaderBackgroundState extends State<HeaderBackground> {
  double postion = 0;
  final _height = Adapt.px(1200).floorToDouble();
  void _imageScroll() {
    if (widget.scrollController.position.pixels <= _height)
      postion = widget.scrollController.position.pixels;
    setState(() {});
  }

  @override
  void initState() {
    widget.scrollController.addListener(_imageScroll);
    super.initState();
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_imageScroll);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.imgUrl == null
        ? Container(
            key: ValueKey('bgEmpty'),
            color: const Color(0xFF607D8B),
            width: MediaQuery.of(context).size.width,
          )
        : Stack(
            children: [
              CachedNetworkImage(
                imageUrl: widget.imgUrl,
                imageBuilder: (context, image) => Container(
                  key: ValueKey(image),
                  transform: Matrix4.translationValues(0, postion, 0),
                  height: _height - postion,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: const Color(0xFF607D8B),
                    image: DecorationImage(
                      image: image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => Container(
                  color: const Color(0xFFAABBCC),
                  height: _height - postion,
                ),
                errorWidget: (context, url, error) => Container(
                  color: const Color(0xFFAABBCC),
                  height: _height - postion,
                ),
                fadeOutDuration: const Duration(milliseconds: 400),
                fadeInDuration: const Duration(milliseconds: 800),
              ),
              ScrollViewBackGround(
                scrollController: widget.scrollController,
                height: Adapt.px(700).floorToDouble(),
                maxOpacity: 0.8,
              )
            ],
          );
  }
}
