import 'package:autocinema/controllers/scroller_controller.dart';
import 'package:autocinema/themes/size_config.dart';
import 'package:autocinema/views/account/account_view.dart';
import 'package:autocinema/views/bill-board/bill_board_view.dart';
import 'package:autocinema/views/comming/comming_view.dart';
import 'package:autocinema/views/home/home_view.dart';
import 'package:autocinema/views/navbar/controller/nav_bar_controller.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavBarView extends GetView<NavBarController> {
  const NavBarView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollerController scroller = Get.find<ScrollerController>();
    SizeConfig().init(context);

    List<Widget> pages = [
      HomeView(),
      BillBoardView(),
      CommingView(),
      AccountView(),
    ];

    return Obx(
      () => Scaffold(
        body: pages[controller.currentIndex],
        extendBody: true,
        bottomNavigationBar: AnimatedOpacity(
          opacity: scroller.show ? 1 : 0,
          curve: Curves.easeInOut,
          duration: Duration(milliseconds: 300),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenWidth(15),
            ),
            child: CustomNavigationBar(
              elevation: 8.0,
              bubbleCurve: Curves.easeIn,
              strokeColor: Colors.transparent,
              iconSize: getProportionateScreenWidth(20),
              selectedColor: Colors.grey,
              unSelectedColor: Colors.grey[300],
              backgroundColor: Colors.white,
              borderRadius: Radius.circular(
                getProportionateScreenWidth(10),
              ),
              items: [
                CustomNavigationBarItem(
                  title: Text(
                    "home".tr,
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(11),
                    ),
                  ),
                  icon: Icon(Icons.home),
                ),
                CustomNavigationBarItem(
                  title: Text(
                    "billboard".tr,
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(11),
                    ),
                  ),
                  icon: Icon(Icons.movie),
                ),
                CustomNavigationBarItem(
                  title: Text(
                    "comming".tr,
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(11),
                    ),
                  ),
                  icon: Icon(Icons.calendar_today),
                ),
                CustomNavigationBarItem(
                  title: Text(
                    "account".tr,
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(11),
                    ),
                  ),
                  icon: Icon(Icons.account_circle),
                ),
              ],
              currentIndex: controller.currentIndex,
              onTap: controller.selectCurrentIndex,
              isFloating: true,
            ),
          ),
        ),
      ),
    );
  }
}
