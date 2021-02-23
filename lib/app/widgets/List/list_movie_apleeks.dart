import 'package:autocinema/app/data/models/movie_model.dart';
import 'package:autocinema/app/utils/get_storage.dart';
import 'package:autocinema/app/themes/adapt.dart';
import 'package:autocinema/app/themes/theme_style.dart';
import 'package:autocinema/app/widgets/Shimmer/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListApleeks extends StatelessWidget {
  final List<MovieModel> movies;
  final bool loading;
  const ListApleeks({
    Key key,
    @required this.movies,
    @required this.loading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = ThemeStyle.getTheme(context);
    return loading
        ? _ShimmerListApleeks()
        : SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext ctx, int index) {
                final movie = movies[index];
                final String path = "${GetStorages.i.server}/storage/images/peliculas/${movie.img}";
                return Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: Adapt.px(10),
                    vertical: Adapt.px(10),
                  ),
                  height: Adapt.px(210),
                  decoration: BoxDecoration(
                    color: _theme.cardColor,
                    borderRadius: BorderRadius.circular(
                      Adapt.px(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(5, 5),
                        color: _theme.brightness == Brightness.light
                            ? _theme.primaryColorDark
                            : const Color(0xFF303030),
                        blurRadius: 5,
                      )
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () => Get.toNamed("movie-details", arguments: movie),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                              Adapt.px(20),
                            ),
                            bottomLeft: Radius.circular(
                              Adapt.px(20),
                            ),
                            bottomRight: Radius.circular(
                              Adapt.px(150) / 2,
                            ),
                          ),
                          child: Container(
                            width: Adapt.px(150),
                            color: const Color(0xFFAABBCC),
                            height: Adapt.px(210),
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl: path,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Adapt.px(10),
                              vertical: Adapt.px(10),
                            ),
                            child: SizedBox(
                              width: Adapt.px(200),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          movie.titulo,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: Adapt.px(13),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          height: Adapt.px(5),
                                        ),
                                        Text(
                                          "${movie.categoria} / ${movie.idioma}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: const Color(0xFF9E9E9E),
                                            fontSize: Adapt.px(10),
                                          ),
                                        ),
                                        SizedBox(
                                          height: Adapt.px(5),
                                        ),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Chip(
                                              padding: EdgeInsets.all(5),
                                              backgroundColor: const Color(0xFF9E9E9E),
                                              label: Row(
                                                children: [
                                                  Icon(
                                                    Icons.insert_emoticon,
                                                    color: Colors.white,
                                                    size: Adapt.px(18),
                                                  ),
                                                  SizedBox(
                                                    width: Adapt.px(5),
                                                  ),
                                                  Text(
                                                    "${movie.clasificacion}",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: Adapt.px(12),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: Adapt.px(5),
                                            ),
                                            Chip(
                                              padding: EdgeInsets.all(5),
                                              backgroundColor: const Color(0xFF9E9E9E),
                                              label: Row(
                                                children: [
                                                  Icon(
                                                    Icons.query_builder,
                                                    color: Colors.white,
                                                    size: Adapt.px(18),
                                                  ),
                                                  SizedBox(
                                                    width: Adapt.px(5),
                                                  ),
                                                  Text(
                                                    "${movie.duracion} min",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: Adapt.px(12),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          child: Text(
                                            movie.descripcion,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: Adapt.px(12),
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      width: Adapt.px(40),
                                      height: Adapt.px(30),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF334455),
                                        borderRadius: BorderRadius.circular(
                                          Adapt.px(10),
                                        ),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.chevron_right,
                                          color: const Color(0xFFFFFFFF),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: movies.length,
            ),
          );
  }
}

class _ShimmerListApleeks extends StatelessWidget {
  const _ShimmerListApleeks({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ShimmerApleeks(
        child: Column(
          children: [
            _ShimmerListItem(),
            _ShimmerListItem(),
            _ShimmerListItem(),
            _ShimmerListItem(),
          ],
        ),
      ),
    );
  }
}

class _ShimmerListItem extends StatelessWidget {
  const _ShimmerListItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Adapt.px(5),
        vertical: Adapt.px(5),
      ),
      height: Adapt.px(160),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Adapt.px(20),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                Adapt.px(30),
              ),
              bottomLeft: Radius.circular(
                Adapt.px(30),
              ),
              bottomRight: Radius.circular(
                Adapt.px(30) / 2,
              ),
            ),
            child: Container(
              width: Adapt.px(150),
              color: const Color(0xFFAABBCC),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Adapt.px(10),
                vertical: Adapt.px(10),
              ),
              child: SizedBox(
                width: Adapt.px(200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            color: Colors.white,
                            width: Adapt.px(170),
                            height: Adapt.px(20),
                          ),
                          SizedBox(
                            height: Adapt.px(5),
                          ),
                          Container(
                            color: Colors.white,
                            width: Adapt.px(120),
                            height: Adapt.px(10),
                          ),
                          SizedBox(
                            height: Adapt.px(5),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Chip(
                                padding: EdgeInsets.all(5),
                                backgroundColor: const Color(0xFF9E9E9E),
                                label: Row(
                                  children: [
                                    Container(
                                      color: Colors.white,
                                      width: 15,
                                    ),
                                    SizedBox(
                                      width: Adapt.px(5),
                                    ),
                                    Container(
                                      color: Colors.white,
                                      width: 15,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: Adapt.px(5),
                              ),
                              Chip(
                                padding: EdgeInsets.all(5),
                                backgroundColor: const Color(0xFF9E9E9E),
                                label: Row(
                                  children: [
                                    Container(
                                      color: Colors.white,
                                      width: 10,
                                    ),
                                    SizedBox(
                                      width: Adapt.px(5),
                                    ),
                                    Container(
                                      color: Colors.white,
                                      width: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            color: Colors.white,
                            height: Adapt.px(20),
                            width: Adapt.px(170),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: Adapt.px(80),
                        height: Adapt.px(30),
                        decoration: BoxDecoration(
                          color: const Color(0xFF334455),
                          borderRadius: BorderRadius.circular(
                            Adapt.px(20),
                          ),
                        ),
                        child: Center(
                          child: Container(
                            color: Colors.white,
                            width: 50,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
