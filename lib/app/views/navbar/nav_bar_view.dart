import 'package:autocinema/app/themes/adapt.dart';
import 'package:autocinema/app/views/account/account_view.dart';
import 'package:autocinema/app/views/bill-board/bill_board_view.dart';
import 'package:autocinema/app/views/comming/comming_view.dart';
import 'package:autocinema/app/views/home/home_view.dart';
import 'package:autocinema/app/views/navbar/controller/nav_bar_controller.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavBarView extends GetView<NavBarController> {
  static final String routeName = '/nav-bar';
  const NavBarView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Adapt.initContext(context);

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
          opacity: 1,
          curve: Curves.easeInOut,
          duration: Duration(milliseconds: 300),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: Adapt.px(15),
            ),
            child: CustomNavigationBar(
              elevation: 8.0,
              bubbleCurve: Curves.easeIn,
              strokeColor: Colors.transparent,
              iconSize: Adapt.px(20),
              selectedColor: Colors.grey,
              unSelectedColor: Colors.grey[300],
              backgroundColor: Colors.white,
              borderRadius: Radius.circular(
                Adapt.px(10),
              ),
              items: [
                CustomNavigationBarItem(
                  title: Text(
                    "home".tr,
                    style: TextStyle(
                      fontSize: Adapt.px(24),
                    ),
                  ),
                  icon: Icon(
                    Icons.home,
                    size: Adapt.px(30),
                  ),
                ),
                CustomNavigationBarItem(
                  title: Text(
                    "billboard".tr,
                    style: TextStyle(
                      fontSize: Adapt.px(24),
                    ),
                  ),
                  icon: Icon(
                    Icons.movie,
                    size: Adapt.px(30),
                  ),
                ),
                CustomNavigationBarItem(
                  title: Text(
                    "comming".tr,
                    style: TextStyle(
                      fontSize: Adapt.px(24),
                    ),
                  ),
                  icon: Icon(
                    Icons.calendar_today,
                    size: Adapt.px(30),
                  ),
                ),
                CustomNavigationBarItem(
                  title: Text(
                    "account".tr,
                    style: TextStyle(
                      fontSize: Adapt.px(24),
                    ),
                  ),
                  icon: Icon(
                    Icons.account_circle,
                    size: Adapt.px(30),
                  ),
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
