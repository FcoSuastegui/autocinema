import 'package:autocinema/app/data/models/movie_model.dart';
import 'package:autocinema/app/routes/routes.dart';
import 'package:autocinema/app/themes/adapt.dart';
import 'package:autocinema/app/widgets/Card/movie_card_front.dart';
import 'package:autocinema/app/widgets/Movie/list_movie_front/controller/list_movie_controller.dart';
import 'package:autocinema/app/widgets/Shimmer/shimmer_list_movie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ListMovieFront extends StatelessWidget {
  final int type;
  final String title;
  final String filter;

  const ListMovieFront({
    Key key,
    this.type = 1,
    this.filter = '',
    this.title = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double heightCard = Adapt.px(740);
    return GetBuilder<ListMovieController>(
      tag: UniqueKey().toString(),
      init: ListMovieController(
        type: type,
        filter: filter,
      ),
      builder: (c) => SliverToBoxAdapter(
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
                    title.tr,
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
                      pagingController: c.movieController,
                      scrollDirection: Axis.horizontal,
                      builderDelegate: PagedChildBuilderDelegate<MovieModel>(
                        firstPageProgressIndicatorBuilder: (context) => ShimmerListMovie(
                          scrollDirection: Axis.horizontal,
                        ),
                        itemBuilder: (context, movie, index) => MovieCardFront(
                          onTap: () => Routes.goToPage(
                            '/movie-details',
                            arguments: movie,
                          ),
                          movie: movie,
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
      ),
    );
  }
}
