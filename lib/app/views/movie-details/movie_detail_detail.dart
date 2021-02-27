import 'package:autocinema/app/themes/adapt.dart';
import 'package:autocinema/app/views/movie-details/components/app_bar_movie_detail.dart';
import 'package:autocinema/app/views/movie-details/components/description_movie.dart';
import 'package:autocinema/app/views/movie-details/components/horaries_movie.dart';
import 'package:autocinema/app/views/movie-details/components/image_background_movie.dart';
import 'package:autocinema/app/views/movie-details/components/information_movie.dart';
import 'package:autocinema/app/views/movie-details/components/trailer_movie.dart';
import 'package:autocinema/app/views/movie-details/controller/movie_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieDetails extends GetView<MovieDetailController> {
  static final String routeName = '/movie-details';
  const MovieDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    final movie = controller.movie;

    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: scrollController,
            physics: ClampingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    AnimatedSwitcher(
                      duration: Duration(milliseconds: 600),
                      child: SizedBox(
                        height: Adapt.px(1200),
                        child: HeaderBackground(
                          imgUrl: movie.image,
                          scrollController: scrollController,
                        ),
                      ),
                    ),
                    InformationMovie(
                      title: movie.titulo,
                      director: movie.director,
                      actores: movie.actores,
                      category: movie.categoria,
                      classification: movie.clasificacion,
                      duration: movie.duracion,
                      description: movie.descripcion,
                      language: movie.idioma.tr,
                      facebook: movie.facebook,
                    ),
                  ],
                ),
              ),
              HorariesMovies(),
              DescriptionMovie(
                description: movie.descripcion,
              ),
              TrailerMovie(
                youtubeId: movie.trailer,
              ),
            ],
          ),
          AppBarMovie(
            controller: scrollController,
            title: movie.titulo,
          ),
        ],
      ),
    );
  }
}
