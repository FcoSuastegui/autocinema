import 'package:autocinema/app/views/cards/card_add_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/route_manager.dart';

class CardView extends StatelessWidget {
  static final String routeName = '/card';
  const CardView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("card".tr),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => Get.to(
              () => CardAddView(),
              fullscreenDialog: true,
            ),
          ),
        ],
      ),
      body: Container(),
    );
  }
}
