import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewer extends StatelessWidget {
  final String heroTag;
  final ImageProvider imageProvider;
  const PhotoViewer({
    Key key,
    @required this.imageProvider,
    this.heroTag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            child: PhotoView(
              imageProvider: imageProvider,
              heroAttributes: PhotoViewHeroAttributes(tag: heroTag),
              loadingBuilder: (context, event) => Center(
                child: Hero(
                  tag: heroTag,
                  child: Container(
                    width: 20.0,
                    height: 20.0,
                    child: CircularProgressIndicator(
                      value: event == null
                          ? 0
                          : event.cumulativeBytesLoaded / event.expectedTotalBytes,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 10,
            child: Container(
              width: Get.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.clear,
                      color: Colors.white,
                    ),
                    onPressed: () => Get.back(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
