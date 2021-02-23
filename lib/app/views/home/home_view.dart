import 'package:autocinema/app/views/home/components/banner_home.dart';
import 'package:autocinema/app/views/home/components/cartelera_home.dart';
import 'package:autocinema/app/views/home/components/proximamente_home.dart';
import 'package:autocinema/app/views/home/components/shimmers/shimmer_main.dart';
import 'package:autocinema/app/views/home/components/youtube_home.dart';
import 'package:autocinema/app/views/home/controller/home_controller.dart';
import 'package:autocinema/app/widgets/KeepAlive/keepalive_widget.dart';
import 'package:autocinema/app/widgets/Shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeepAliveWidget(
      Scaffold(
        body: GetBuilder<HomeController>(
          init: HomeController.i,
          builder: (controller) => Obx(
            () => controller.loading
                ? ShimmerApleeks(
                    child: ShimmerMain(),
                  )
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const BannerHome(),
                        const CarteleraHome(),
                        const YouTubeHome(),
                        const ProximamenteHome()
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
