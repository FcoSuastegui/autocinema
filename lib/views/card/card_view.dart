import 'package:autocinema/views/card/components/card_list.dart';
import 'package:autocinema/views/card/controller/card_controller.dart';
import 'package:autocinema/widgets/AppBar/my_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardView extends GetView<CardController> {
  const CardView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        context: context,
        appBarTitle: 'my-cards'.tr,
        leadingIcon: Icons.clear,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: () => Get.toNamed('/card/card-add'),
          )
        ],
      ),
      body: CardList(),
    );
  }
}
