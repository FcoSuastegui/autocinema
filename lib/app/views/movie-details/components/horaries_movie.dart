import 'package:autocinema/app/data/models/horary_model.dart';
import 'package:autocinema/app/data/models/movie_model.dart';
import 'package:autocinema/app/themes/adapt.dart';
import 'package:autocinema/app/themes/app_theme.dart';
import 'package:autocinema/app/themes/theme_style.dart';
import 'package:autocinema/app/utils/helper.dart';
import 'package:autocinema/app/utils/storage.dart';
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
              SizedBox(
                height: 20,
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
                child: controller.horaries.length > 0
                    ? Container(
                        height: Adapt.px(200),
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) {
                            final horary = controller.horaries[index];
                            return GestureDetector(
                              onTap: () async {
                                if (Storage.auth) {
                                  payment(
                                    controller.movie,
                                    horary,
                                  );
                                } else {
                                  final auth = await Helper.login();
                                  if (auth) {
                                    payment(
                                      controller.movie,
                                      horary,
                                    );
                                  }
                                }
                              },
                              child: Container(
                                width: Adapt.px(200),
                                decoration: BoxDecoration(
                                  color: _theme.cardColor,
                                  border: Border.all(color: Colors.black.withOpacity(0.1)),
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(
                                      Adapt.px(30),
                                    ),
                                    bottom: Radius.circular(
                                      Adapt.px(30),
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
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      child: Text(
                                        horary.dia,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        horary.fecha,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    horary.especial == 1
                                        ? SizedBox.shrink()
                                        : Container(
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
                        width: double.infinity,
                        height: Adapt.px(300),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: Image.asset("assets/images/sin-funciones.png").image,
                            fit: BoxFit.cover,
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

  void payment(MovieModel movie, HoraryModel horary) {
    Get.to(
      () => PaymentsView(
        movie: movie,
        horary: horary,
      ),
      fullscreenDialog: true,
    );
  }
}
