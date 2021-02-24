import 'package:autocinema/app/data/models/movie_model.dart';
import 'package:autocinema/app/themes/adapt.dart';
import 'package:autocinema/app/themes/theme_style.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movie;
  final Function onTap;
  final double height;

  const MovieCard({
    Key key,
    @required this.movie,
    this.onTap,
    this.height = 300,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = ThemeStyle.getTheme(context);
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Adapt.px(10),
      ),
      height: height ?? Adapt.px(330),
      decoration: BoxDecoration(
        color: _theme.cardColor,
        borderRadius: BorderRadius.circular(
          Adapt.px(10),
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
        onTap: onTap,
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
                  Adapt.px(80) / 2,
                ),
              ),
              child: Container(
                width: Adapt.px(200),
                height: height ?? Adapt.px(330),
                color: const Color(0xFFAABBCC),
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: movie.image,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Adapt.px(10),
                vertical: Adapt.px(10),
              ),
              child: SizedBox(
                width: Adapt.px(400),
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
                              fontSize: Adapt.px(25),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: Adapt.px(5),
                          ),
                          Text(
                            movie.categoria,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFF9E9E9E),
                              fontSize: Adapt.px(20),
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
                                      size: Adapt.px(20),
                                    ),
                                    SizedBox(
                                      width: Adapt.px(5),
                                    ),
                                    Text(
                                      "${movie.clasificacion}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: Adapt.px(18),
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
                                      size: Adapt.px(20),
                                    ),
                                    SizedBox(
                                      width: Adapt.px(5),
                                    ),
                                    Text(
                                      "${movie.duracion} min",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: Adapt.px(18),
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
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: Adapt.px(20),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: Adapt.px(60),
                        height: Adapt.px(50),
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
            )
          ],
        ),
      ),
    );
  }
}
