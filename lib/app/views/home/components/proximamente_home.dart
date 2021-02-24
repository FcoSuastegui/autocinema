import 'package:autocinema/app/themes/adapt.dart';
import 'package:autocinema/app/views/home/controller/home_controller.dart';
import 'package:autocinema/app/widgets/Card/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProximamenteHome extends GetView<HomeController> {
  const ProximamenteHome({Key key}) : super(key: key);

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
              height: heightCard,
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
                  return MovieCard(
                    movie: proximamente,
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
