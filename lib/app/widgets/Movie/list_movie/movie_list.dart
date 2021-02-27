import 'package:autocinema/app/data/models/movie_model.dart';
import 'package:autocinema/app/routes/routes.dart';
import 'package:autocinema/app/themes/adapt.dart';
import 'package:autocinema/app/widgets/Card/movie_card.dart';
import 'package:autocinema/app/widgets/Movie/list_movie/controller/list_movie_controller.dart';
import 'package:autocinema/app/widgets/Shimmer/shimmer_list_movie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ListMovie extends StatelessWidget {
  final int type;
  final String filter;

  const ListMovie({
    Key key,
    this.type = 1,
    this.filter = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListMovieController>(
      tag: UniqueKey().toString(),
      init: ListMovieController(
        type: type,
        filter: filter,
      ),
      builder: (c) => PagedSliverList.separated(
        pagingController: c.movieController,
        builderDelegate: PagedChildBuilderDelegate<MovieModel>(
          firstPageProgressIndicatorBuilder: (context) => ShimmerListMovie(),
          itemBuilder: (context, movie, index) => MovieCard(
            height: Adapt.px(350),
            movie: movie,
            onTap: () => Routes.goToPage(
              '/movie-details',
              arguments: movie,
            ),
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(
          height: Adapt.px(30),
        ),
      ),
    );
  }
}
