import 'package:autocinema/app/data/models/movie_model.dart';
import 'package:autocinema/app/routes/routes.dart';
import 'package:autocinema/app/themes/adapt.dart';
import 'package:autocinema/app/widgets/Card/card_refresh.dart';
import 'package:autocinema/app/widgets/Card/movie_card.dart';
import 'package:autocinema/app/widgets/Movie/list_movie/controller/list_movie_controller.dart';
import 'package:autocinema/app/widgets/Shimmer/shimmer_list_movie.dart';
import 'package:autocinema/app/widgets/Sliver/sliver_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class MovieView extends StatelessWidget {
  final int type;
  final String filter;
  final List<Widget> slivers;

  const MovieView({
    Key key,
    this.type = 1,
    this.filter = '',
    this.slivers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListMovieController>(
      tag: UniqueKey().toString(),
      init: ListMovieController(
        type: type,
        filter: filter,
      ),
      builder: (c) => SliverScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        onRefresh: () => Future.sync(
          () => c.movieController.refresh(),
        ),
        slivers: getSlivers(
          slivers,
          PagedSliverList.separated(
            pagingController: c.movieController,
            builderDelegate: PagedChildBuilderDelegate<MovieModel>(
              firstPageProgressIndicatorBuilder: (context) => ShimmerListMovie(),
              noItemsFoundIndicatorBuilder: (context) => CardRefresh(
                title: Text("No hay peliculas disponibles"),
              ),
              firstPageErrorIndicatorBuilder: (context) => CardRefresh(
                title: Text("Hubo un error al cargar las peliculas"),
              ),
              itemBuilder: (context, movie, index) => MovieCard(
                height: Adapt.px(380),
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
        ),
      ),
    );
  }

  List<Widget> getSlivers(List<Widget> slivers, Widget widget) {
    List<Widget> childs = [];
    slivers.forEach((e) => childs.add(e));
    childs.add(widget);
    return childs;
  }
}
