import 'package:autocinema/app/utils/get_storage.dart';
import 'package:autocinema/app/themes/adapt.dart';
import 'package:autocinema/app/views/movie-details/components/app_bar_movie_detail.dart';
import 'package:autocinema/app/views/movie-details/components/description_movie.dart';
import 'package:autocinema/app/views/movie-details/components/image_background_movie.dart';
import 'package:autocinema/app/views/movie-details/components/information_movie.dart';
import 'package:autocinema/app/views/movie-details/components/trailer_movie.dart';
import 'package:autocinema/app/views/movie-details/controller/movie_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieDetails extends GetView<MovieController> {
  static final String routeName = '/movie-details"';
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
                        height: Adapt.px(600),
                        child: HeaderBackground(
                          imgUrl: "${GetStorages.i.server}/storage/images/peliculas/${movie.img}",
                          scrollController: scrollController,
                        ),
                      ),
                    ),
                    InformationMovie(
                      title: movie.titulo,
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
              DescriptionMovie(
                description: movie.descripcion,
              ),
              TrailerMovie(
                youtubeId: movie.trailer,
              )
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
