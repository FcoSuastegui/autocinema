import 'package:autocinema/app/views/home/controller/home_controller.dart';
import 'package:autocinema/app/widgets/Carousel/carousel_indicator/carousel_indicator.dart';
import 'package:autocinema/app/widgets/Carousel/carousel_indicator/controller/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BannerHome extends GetView<HomeController> {
  const BannerHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: CarouselWithIndicator(
        controller: CarouselIndicatorController(),
        listImage: controller.banners,
        fit: BoxFit.fill,
      ),
    );
  }
}
