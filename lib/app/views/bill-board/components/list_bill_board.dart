import 'package:autocinema/app/data/models/movie_model.dart';
import 'package:autocinema/app/themes/adapt.dart';
import 'package:autocinema/app/views/bill-board/controller/bill_board_controller.dart';
import 'package:autocinema/app/widgets/Card/movie_card.dart';
import 'package:autocinema/app/widgets/Shimmer/shimmer_list_movie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ListBillBoard extends GetView<BillBoardController> {
  const ListBillBoard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PagedSliverList.separated(
      pagingController: controller.carteleraController,
      builderDelegate: PagedChildBuilderDelegate<MovieModel>(
        firstPageProgressIndicatorBuilder: (context) => ShimmerListMovie(),
        itemBuilder: (context, cartelera, index) => MovieCard(
          height: Adapt.px(330),
          movie: cartelera,
        ),
      ),
      separatorBuilder: (context, index) => SizedBox(
        height: Adapt.px(30),
      ),
    );
  }
}
