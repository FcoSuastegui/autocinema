import 'package:autocinema/app/themes/adapt.dart';
import 'package:autocinema/app/themes/app_theme.dart';
import 'package:autocinema/app/themes/theme_style.dart';
import 'package:autocinema/app/views/movie-details/controller/movie_detail_controller.dart';
import 'package:autocinema/app/views/payments/payments_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HorariesMovies extends GetView<MovieDetailController> {
  const HorariesMovies({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = ThemeStyle.getTheme(context);
    return SliverToBoxAdapter(
      child: Obx(
        () => Container(
          color: _theme.cardColor,
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  "Horarios",
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              Divider(),
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
                child: controller.horaries.length > 0
                    ? Container(
                        height: Adapt.px(200),
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) {
                            final horary = controller.horaries[index];
                            return GestureDetector(
                              onTap: () => Get.to(
                                PaymentsView(
                                  movie: controller.movie,
                                  horary: horary,
                                ),
                                fullscreenDialog: true,
                              ),
                              child: Container(
                                width: Adapt.px(200),
                                decoration: BoxDecoration(
                                  color: _theme.cardColor,
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(
                                      Adapt.px(20),
                                    ),
                                    bottom: Radius.circular(
                                      Adapt.px(20),
                                    ),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.symmetric(vertical: 4),
                                      decoration: BoxDecoration(
                                        color: AppTheme.kPrimaryColor,
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(
                                            Adapt.px(20),
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        horary.hora,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        horary.dia,
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        horary.fecha,
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        horary.idioma,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: controller.horaries.length,
                          separatorBuilder: (_, index) {
                            return SizedBox(
                              width: Adapt.px(20),
                            );
                          },
                        ),
                      )
                    : Container(
                        height: Adapt.px(50),
                        child: Center(
                          child: Text(
                            "Sin funciones por el momento.",
                            style: TextStyle(
                              color: AppTheme.kPrimaryColor,
                            ),
                          ),
                        ),
                      ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
