import 'package:autocinema/app/data/models/movie_model.dart';
import 'package:autocinema/app/routes/routes.dart';
import 'package:autocinema/app/themes/adapt.dart';
import 'package:autocinema/app/views/home/controller/home_controller.dart';
import 'package:autocinema/app/widgets/Card/movie_card_front.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CarteleraHome extends GetView<HomeController> {
  const CarteleraHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double heightCard = Adapt.px(740);
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: Adapt.px(20),
              vertical: Adapt.px(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'billboard'.tr,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: Adapt.px(40),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: heightCard,
                  child: PagedListView<int, MovieModel>.separated(
                    padding: EdgeInsets.symmetric(
                      horizontal: Adapt.px(10),
                    ),
                    pagingController: controller.carteleraController,
                    scrollDirection: Axis.horizontal,
                    builderDelegate: PagedChildBuilderDelegate<MovieModel>(
                      firstPageProgressIndicatorBuilder: (context) => SizedBox.shrink(),
                      itemBuilder: (context, cartelera, index) => MovieCardFront(
                        onTap: () => Routes.goToPage('/movie-details', arguments: cartelera),
                        movie: cartelera,
                      ),
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                      width: Adapt.px(30),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
