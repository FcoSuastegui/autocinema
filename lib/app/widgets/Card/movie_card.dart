import 'package:autocinema/app/data/models/movie_model.dart';
import 'package:autocinema/app/themes/adapt.dart';
import 'package:autocinema/app/themes/app_theme.dart';
import 'package:autocinema/app/themes/theme_style.dart';
import 'package:autocinema/app/widgets/Animation/pulse_animation.dart';
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
    return GestureDetector(
      key: ValueKey('recommendation${movie.id}'),
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Stack(
        children: [
          Container(
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
                  child: CachedNetworkImage(
                    imageUrl: movie.image,
                    imageBuilder: (context, image) => Container(
                      height: height ?? Adapt.px(330),
                      width: Adapt.px(230),
                      decoration: BoxDecoration(
                        color: const Color(0xFFAABBCC),
                        image: DecorationImage(
                          image: image,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => Container(
                      width: Adapt.px(230),
                      height: height ?? Adapt.px(330),
                      decoration: BoxDecoration(
                        color: const Color(0xFFAABBCC),
                        image: DecorationImage(
                          image: Image.asset("assets/images/cargando-imagen.png").image,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      width: Adapt.px(230),
                      height: height ?? Adapt.px(330),
                      decoration: BoxDecoration(
                        color: const Color(0xFFAABBCC),
                        image: DecorationImage(
                          image: Image.asset("assets/images/imagen-no-disponible.png").image,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    fadeOutDuration: const Duration(milliseconds: 400),
                    fadeInDuration: const Duration(milliseconds: 800),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Adapt.px(20),
                      vertical: Adapt.px(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
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
                                  color: Colors.black.withOpacity(0.8),
                                  fontSize: Adapt.px(28),
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
                                  fontSize: Adapt.px(28),
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Transform(
                                    transform: new Matrix4.identity()..scale(0.7),
                                    child: Chip(
                                      padding: EdgeInsets.all(5),
                                      backgroundColor: const Color(0xFF9E9E9E),
                                      label: Row(
                                        children: [
                                          Icon(
                                            Icons.insert_emoticon,
                                            color: Colors.white,
                                            size: Adapt.px(40),
                                          ),
                                          SizedBox(
                                            width: Adapt.px(5),
                                          ),
                                          Text(
                                            "${movie.clasificacion}",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: Adapt.px(30),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: Adapt.px(5),
                                  ),
                                  Transform(
                                    transform: new Matrix4.identity()..scale(0.7),
                                    child: Chip(
                                      padding: EdgeInsets.all(5),
                                      backgroundColor: const Color(0xFF9E9E9E),
                                      label: Row(
                                        children: [
                                          Icon(
                                            Icons.query_builder,
                                            color: Colors.white,
                                            size: Adapt.px(40),
                                          ),
                                          SizedBox(
                                            width: Adapt.px(5),
                                          ),
                                          Text(
                                            "${movie.duracion} min",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: Adapt.px(30),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                child: Text(
                                  movie.descripcion,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: Adapt.px(25),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            width: Adapt.px(60),
                            height: Adapt.px(50),
                            decoration: BoxDecoration(
                              color: AppTheme.kPrimaryColor,
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
              ],
            ),
          ),
          Positioned(
            left: 5,
            child: movie.reciente == 1
                ? PulseAnimation(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(
                          Adapt.px(10),
                        ),
                        topLeft: Radius.circular(
                          Adapt.px(20),
                        ),
                      ),
                      child: Container(
                        width: Adapt.px(200),
                        padding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Text(
                          "ESTRENO",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFF1494E),
                        ),
                      ),
                    ),
                  )
                : SizedBox.shrink(),
          )
        ],
      ),
    );
  }
}
