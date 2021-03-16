import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'controller/carousel_controller.dart';
import 'package:autocinema/app/themes/adapt.dart';

class CarouselWithIndicator extends StatelessWidget {
  final List<String> listImage;
  final bool network;
  final BoxFit fit;
  final CarouselIndicatorController controller;

  const CarouselWithIndicator({
    Key key,
    @required this.listImage,
    @required this.controller,
    this.fit,
    this.network = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final carouselController = CarouselController();

    final List<Widget> imageSliders = listImage
        .map(
          (item) => Container(
            child: network
                ? CachedNetworkImage(
                    imageUrl: item,
                    imageBuilder: (context, image) => Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: const Color(0xFFAABBCC),
                        image: DecorationImage(
                          image: image,
                          fit: fit,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: const Color(0xFFAABBCC),
                        image: DecorationImage(
                          image: Image.asset("assets/images/cargando-imagen.png").image,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: const Color(0xFFAABBCC),
                        image: DecorationImage(
                          image: Image.asset("assets/images/imagen-no-disponible.png").image,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    fadeOutDuration: const Duration(milliseconds: 400),
                    fadeInDuration: const Duration(milliseconds: 800),
                  )
                : Image.asset(
                    item,
                    fit: BoxFit.cover,
                    width: Get.width,
                  ),
          ),
        )
        .toList();

    return Column(
      children: [
        Stack(
          children: [
            CarouselSlider(
              carouselController: carouselController,
              items: imageSliders,
              options: CarouselOptions(
                autoPlay: listImage.length > 1 ? true : false,
                enableInfiniteScroll: listImage.length > 1 ? true : false,
                enlargeCenterPage: true,
                aspectRatio: 15 / 9,
                viewportFraction: 1.0,
                autoPlayCurve: Curves.easeOut,
                onPageChanged: (index, reason) {
                  controller.currentIndex = index;
                },
              ),
            ),
            Positioned(
              bottom: 0.0,
              child: listImage.length > 1
                  ? Container(
                      width: Get.width,
                      color: Colors.black54,
                      padding: EdgeInsets.symmetric(
                        vertical: Adapt.px(5),
                        horizontal: Adapt.px(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: listImage.map((url) {
                          int index = listImage.indexOf(url);
                          return Obx(
                            () => Container(
                              width: 10.0,
                              height: 10.0,
                              margin: EdgeInsets.symmetric(
                                vertical: 5.0,
                                horizontal: 2.0,
                              ),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: controller.currentIndex == index
                                    ? Colors.white
                                    : Colors.white.withOpacity(0.2),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    )
                  : SizedBox.shrink(),
            ),
          ],
        ),
      ],
    );
  }
}
