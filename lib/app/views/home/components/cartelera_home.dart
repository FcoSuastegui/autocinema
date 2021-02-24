import 'package:autocinema/app/themes/adapt.dart';
import 'package:autocinema/app/views/home/controller/home_controller.dart';
import 'package:autocinema/app/widgets/Card/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarteleraHome extends GetView<HomeController> {
  const CarteleraHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double heightCard = Adapt.px(330);
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
              horizontal: Adapt.px(10),
              vertical: Adapt.px(10),
            ),
            child: Text(
              'billboard'.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                fontSize: Adapt.px(30),
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
              height: heightCard,
              child: ListView.separated(
                itemCount: controller.cartelera.length,
                padding: EdgeInsets.symmetric(
                  horizontal: Adapt.px(5),
                ),
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (_, index) => SizedBox(
                  width: Adapt.px(5),
                ),
                itemBuilder: (_, index) {
                  final cartelera = controller.cartelera[index];
                  return MovieCard(
                    movie: cartelera,
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
