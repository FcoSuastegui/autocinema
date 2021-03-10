import 'package:autocinema/app/data/models/movie_model.dart';
import 'package:autocinema/app/themes/adapt.dart';
import 'package:autocinema/app/themes/theme_style.dart';
import 'package:autocinema/app/widgets/Animation/pulse_animation.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MovieCardFront extends StatelessWidget {
  final MovieModel movie;
  final Function onTap;

  const MovieCardFront({
    Key key,
    this.movie,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = ThemeStyle.getTheme(context);
    final height = Adapt.px(350);
    return GestureDetector(
      key: ValueKey('recommendation${movie.id}'),
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(
                Adapt.px(20),
              ),
            ),
            child: Container(
              width: height,
              decoration: BoxDecoration(
                color: _theme.cardColor,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                    imageUrl: movie.image,
                    imageBuilder: (context, image) => Container(
                      height: height * 1.2,
                      width: height,
                      decoration: BoxDecoration(
                        color: const Color(0xFFAABBCC),
                        image: DecorationImage(
                          image: image,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => Container(
                      height: height * 1.2,
                      decoration: BoxDecoration(
                        color: const Color(0xFFAABBCC),
                        image: DecorationImage(
                          image: Image.asset("assets/images/cargando-imagen.png").image,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      height: height * 1.2,
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
                  SizedBox(
                    height: Adapt.px(20),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Text(
                      movie.titulo,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: Adapt.px(24),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Row(
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
                        Expanded(
                          child: Transform(
                            transform: new Matrix4.identity()..scale(0.7),
                            child: Chip(
                              padding: EdgeInsets.all(5),
                              backgroundColor: const Color(0xFF9E9E9E),
                              label: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.query_builder,
                                    color: Colors.white,
                                    size: Adapt.px(40),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "${movie.duracion} min",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: Adapt.px(30),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Text(
                      movie.descripcion,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.4),
                        fontWeight: FontWeight.bold,
                        fontSize: Adapt.px(24),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
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
