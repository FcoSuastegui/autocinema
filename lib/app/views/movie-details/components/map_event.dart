import 'package:autocinema/app/themes/adapt.dart';
import 'package:autocinema/app/widgets/PhotoView/PhotoView/photo_viewer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MapEvent extends StatelessWidget {
  final String map;

  const MapEvent({
    Key key,
    this.map,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: Text(
                "Ver mapa de zonas",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: Adapt.px(30),
                ),
              ),
            ),
            SizedBox(
              height: Adapt.px(10),
            ),
            GestureDetector(
              onTap: () => Get.to(
                () => PhotoViewer(
                  imageProvider: NetworkImage(map),
                  heroTag: map,
                ),
                fullscreenDialog: true,
              ),
              child: CachedNetworkImage(
                imageUrl: map,
                imageBuilder: (context, image) => Container(
                  height: Adapt.px(500),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: image,
                    ),
                  ),
                ),
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
