import 'package:autocinema/app/views/home/components/banner_home.dart';
import 'package:autocinema/app/views/home/components/cartelera_home.dart';
import 'package:autocinema/app/views/home/components/proximamente_home.dart';
import 'package:autocinema/app/views/home/components/youtube_home.dart';
import 'package:autocinema/app/views/home/controller/home_controller.dart';
import 'package:autocinema/app/widgets/Shimmer/shimmer_list_movie.dart';
import 'package:autocinema/app/widgets/Sliver/sliver_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(
        init: HomeController.i,
        builder: (c) => Obx(
          () => c.loading
              ? ShimmerListMovie(
                  isPageList: false,
                )
              : SliverScrollView(
                  onRefresh: () => Future.sync(
                    () => c.init(),
                  ),
                  slivers: [
                    const BannerHome(),
                    const CarteleraHome(),
                    const YouTubeHome(),
                    const ProximamenteHome()
                  ],
                ),
        ),
      ),
    );
  }
}
