import 'package:autocinema/themes/size_config.dart';
import 'package:autocinema/widgets/ScrollView/scrollview_background.dart';
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
  final _height = getProportionateScreenWidth(600).floorToDouble();
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
              Container(
                width: MediaQuery.of(context).size.width,
                key: ValueKey(widget.imgUrl),
                transform: Matrix4.translationValues(0, postion, 0),
                height: _height - postion,
                decoration: BoxDecoration(
                  color: const Color(0xFF607D8B),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(
                      widget.imgUrl,
                    ),
                  ),
                ),
              ),
              ScrollViewBackGround(
                scrollController: widget.scrollController,
                height: getProportionateScreenWidth(600).floorToDouble(),
                maxOpacity: 0.8,
              )
            ],
          );
  }
}
