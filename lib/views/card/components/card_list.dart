import 'package:autocinema/views/card/controller/card_controller.dart';
import 'package:autocinema/widgets/Cards/components/card_front_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';

class CardList extends GetView<CardController> {
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Obx(
      () {
        final cards = controller.cards;
        return controller.loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: <Widget>[
                  SizedBox(
                    height: _screenSize.height * 0.8,
                    child: Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        final card = cards[index];
                        return CardFrontList(
                          cardModel: cards[index],
                          onTap: () => Get.toNamed(
                            '/card/card-details',
                            arguments: card,
                          ),
                        );
                      },
                      itemCount: cards.length,
                      itemWidth: _screenSize.width * 0.7,
                      itemHeight: _screenSize.height * 0.52,
                      layout: SwiperLayout.STACK,
                      scrollDirection: Axis.horizontal,
                    ),
                  )
                ],
              );
      },
    );
  }
}
