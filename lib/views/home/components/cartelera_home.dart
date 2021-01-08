import 'package:autocinema/helpers/get_storages.dart';
import 'package:autocinema/themes/size_config.dart';
import 'package:autocinema/themes/theme_style.dart';
import 'package:autocinema/views/home/controller/home_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarteleraHome extends GetView<HomeController> {
  const CarteleraHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = ThemeStyle.getTheme(context);
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(10),
              vertical: getProportionateScreenWidth(10),
            ),
            child: Text(
              'billboard'.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                fontSize: getProportionateScreenWidth(19),
              ),
            ),
          ),
          AnimatedSwitcher(
            transitionBuilder: (widget, animated) => SlideTransition(
              position: animated.drive(
                Tween(
                  begin: Offset(1, 0),
                  end: Offset.zero,
                ),
              ),
              child: widget,
            ),
            switchInCurve: Curves.easeIn,
            switchOutCurve: Curves.easeOut,
            duration: Duration(milliseconds: 300),
            child: Container(
              height: getProportionateScreenWidth(200),
              child: ListView.separated(
                itemCount: controller.cartelera.length,
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(5),
                ),
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (_, index) => SizedBox(
                  width: getProportionateScreenWidth(0),
                ),
                itemBuilder: (_, index) {
                  final cartelera = controller.cartelera[index];
                  final String path =
                      "${GetStorages.i.server}/storage/images/peliculas/${cartelera.img}";
                  return Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(10),
                    ),
                    height: getProportionateScreenWidth(170),
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
                      onTap: () => Get.toNamed("movie-details", arguments: cartelera),
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
                                getProportionateScreenWidth(80) / 2,
                              ),
                            ),
                            child: Container(
                              width: getProportionateScreenWidth(150),
                              color: const Color(0xFFAABBCC),
                              child: CachedNetworkImage(
                                fit: BoxFit.fill,
                                imageUrl: path,
                              ),
                            ),
                          ),
                          Padding(
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
                                          cartelera.titulo,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: getProportionateScreenWidth(14),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          height: getProportionateScreenWidth(5),
                                        ),
                                        Text(
                                          cartelera.categoria,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: const Color(0xFF9E9E9E),
                                            fontSize: getProportionateScreenWidth(13),
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
                                                    "${cartelera.clasificacion}",
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
                                                    "${cartelera.duracion} min",
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
                                            cartelera.descripcion,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: getProportionateScreenWidth(12),
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
                                      width: getProportionateScreenWidth(60),
                                      height: getProportionateScreenWidth(40),
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
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
