import 'package:autocinema/app/globals/controller/scroll_bar_controller.dart';
import 'package:autocinema/app/views/home/components/banner_home.dart';
import 'package:autocinema/app/views/home/components/cartelera_home.dart';
import 'package:autocinema/app/views/home/components/proximamente_home.dart';
import 'package:autocinema/app/views/home/components/shimmers/shimmer_main.dart';
import 'package:autocinema/app/views/home/components/youtube_home.dart';
import 'package:autocinema/app/views/home/controller/home_controller.dart';
import 'package:autocinema/app/widgets/KeepAlive/keepalive_widget.dart';
import 'package:autocinema/app/widgets/Shimmer/shimmer.dart';
import 'package:autocinema/app/widgets/Sliver/sliver_scroll_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController scroll = Get.find<ScrollBarController>().scroll;
    return Scaffold(
      extendBody: true,
      body: GetBuilder<HomeController>(
        init: HomeController.i,
        builder: (controller) => Container(
          child: SliverScrollBarView(
            controller: scroll,
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: List.generate(400, (index) {
                    return Text(index.toString());
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
