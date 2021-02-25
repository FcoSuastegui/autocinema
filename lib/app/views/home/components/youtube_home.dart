import 'package:autocinema/app/views/home/controller/home_controller.dart';
import 'package:autocinema/app/widgets/Trailers/trailer_apleeks.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class YouTubeHome extends GetView<HomeController> {
  const YouTubeHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: TrailerApleeks(
        videoId: controller.stringKey.value,
      ),
    );
  }
}
