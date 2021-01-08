import 'package:autocinema/data/models/movie_model.dart';
import 'package:autocinema/helpers/get_storages.dart';
import 'package:autocinema/themes/size_config.dart';
import 'package:autocinema/themes/theme_style.dart';
import 'package:autocinema/widgets/Shimmer/shimmer.dart';
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
                    horizontal: getProportionateScreenWidth(10),
                    vertical: getProportionateScreenWidth(10),
                  ),
                  height: getProportionateScreenWidth(210),
                  decoration: BoxDecoration(
                    color: _theme.cardColor,
                    borderRadius: BorderRadius.circular(
                      getProportionateScreenWidth(20),
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
                              getProportionateScreenWidth(20),
                            ),
                            bottomLeft: Radius.circular(
                              getProportionateScreenWidth(20),
                            ),
                            bottomRight: Radius.circular(
                              getProportionateScreenWidth(150) / 2,
                            ),
                          ),
                          child: Container(
                            width: getProportionateScreenWidth(150),
                            color: const Color(0xFFAABBCC),
                            height: getProportionateScreenWidth(210),
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl: path,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(10),
                              vertical: getProportionateScreenWidth(10),
                            ),
                            child: SizedBox(
                              width: getProportionateScreenWidth(200),
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
                                            fontSize: getProportionateScreenWidth(13),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          height: getProportionateScreenWidth(5),
                                        ),
                                        Text(
                                          "${movie.categoria} / ${movie.idioma}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: const Color(0xFF9E9E9E),
                                            fontSize: getProportionateScreenWidth(10),
                                          ),
                                        ),
                                        SizedBox(
                                          height: getProportionateScreenWidth(5),
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
                                                    size: getProportionateScreenWidth(18),
                                                  ),
                                                  SizedBox(
                                                    width: getProportionateScreenWidth(5),
                                                  ),
                                                  Text(
                                                    "${movie.clasificacion}",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: getProportionateScreenWidth(12),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: getProportionateScreenWidth(5),
                                            ),
                                            Chip(
                                              padding: EdgeInsets.all(5),
                                              backgroundColor: const Color(0xFF9E9E9E),
                                              label: Row(
                                                children: [
                                                  Icon(
                                                    Icons.query_builder,
                                                    color: Colors.white,
                                                    size: getProportionateScreenWidth(18),
                                                  ),
                                                  SizedBox(
                                                    width: getProportionateScreenWidth(5),
                                                  ),
                                                  Text(
                                                    "${movie.duracion} min",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: getProportionateScreenWidth(12),
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
                                              fontSize: getProportionateScreenWidth(12),
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
                                      width: getProportionateScreenWidth(40),
                                      height: getProportionateScreenWidth(30),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF334455),
                                        borderRadius: BorderRadius.circular(
                                          getProportionateScreenWidth(10),
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
        horizontal: getProportionateScreenWidth(5),
        vertical: getProportionateScreenWidth(5),
      ),
      height: getProportionateScreenWidth(160),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          getProportionateScreenWidth(20),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                getProportionateScreenWidth(30),
              ),
              bottomLeft: Radius.circular(
                getProportionateScreenWidth(30),
              ),
              bottomRight: Radius.circular(
                getProportionateScreenWidth(30) / 2,
              ),
            ),
            child: Container(
              width: getProportionateScreenWidth(150),
              color: const Color(0xFFAABBCC),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(10),
                vertical: getProportionateScreenWidth(10),
              ),
              child: SizedBox(
                width: getProportionateScreenWidth(200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            color: Colors.white,
                            width: getProportionateScreenWidth(170),
                            height: getProportionateScreenWidth(20),
                          ),
                          SizedBox(
                            height: getProportionateScreenWidth(5),
                          ),
                          Container(
                            color: Colors.white,
                            width: getProportionateScreenWidth(120),
                            height: getProportionateScreenWidth(10),
                          ),
                          SizedBox(
                            height: getProportionateScreenWidth(5),
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
                                      width: getProportionateScreenWidth(5),
                                    ),
                                    Container(
                                      color: Colors.white,
                                      width: 15,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: getProportionateScreenWidth(5),
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
                                      width: getProportionateScreenWidth(5),
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
                            height: getProportionateScreenWidth(20),
                            width: getProportionateScreenWidth(170),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: getProportionateScreenWidth(80),
                        height: getProportionateScreenWidth(30),
                        decoration: BoxDecoration(
                          color: const Color(0xFF334455),
                          borderRadius: BorderRadius.circular(
                            getProportionateScreenWidth(20),
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
