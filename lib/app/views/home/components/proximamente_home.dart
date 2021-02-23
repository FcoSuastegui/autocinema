import 'package:autocinema/app/utils/get_storage.dart';
import 'package:autocinema/app/themes/adapt.dart';
import 'package:autocinema/app/themes/theme_style.dart';
import 'package:autocinema/app/views/home/controller/home_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProximamenteHome extends GetView<HomeController> {
  const ProximamenteHome({Key key}) : super(key: key);

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
              horizontal: Adapt.px(10),
            ),
            margin: EdgeInsets.only(
              bottom: Adapt.px(10),
            ),
            child: Text(
              'comming'.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                fontSize: Adapt.px(19),
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
              height: Adapt.px(200),
              margin: EdgeInsets.only(
                bottom: Adapt.px(30),
              ),
              child: ListView.separated(
                itemCount: controller.proximamente.length,
                padding: EdgeInsets.symmetric(
                  horizontal: Adapt.px(5),
                ),
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (_, index) => SizedBox(
                  width: Adapt.px(0),
                ),
                itemBuilder: (_, index) {
                  final proximamente = controller.proximamente[index];
                  final String path =
                      "${GetStorages.i.server}/storage/images/peliculas/${proximamente.img}";
                  return Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: Adapt.px(10),
                    ),
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
                      onTap: () => Get.toNamed("movie-details", arguments: proximamente),
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
                              width: Adapt.px(150),
                              color: const Color(0xFFAABBCC),
                              height: Adapt.px(210),
                              child: CachedNetworkImage(
                                fit: BoxFit.fill,
                                imageUrl: path,
                              ),
                            ),
                          ),
                          Padding(
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
                                          proximamente.titulo,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: Adapt.px(14),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          height: Adapt.px(5),
                                        ),
                                        Text(
                                          proximamente.categoria,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: const Color(0xFF9E9E9E),
                                            fontSize: Adapt.px(13),
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
                                                    "${proximamente.clasificacion}",
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
                                                    "${proximamente.duracion} min",
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
                                            proximamente.descripcion,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: Adapt.px(10),
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
                                      height: Adapt.px(40),
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
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
