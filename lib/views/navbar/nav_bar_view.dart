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
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenWidth(20),
          ),
          child: AnimatedOpacity(
            opacity: scroller.show ? 1 : 0,
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: 300),
            child: CustomNavigationBar(
              elevation: 10.0,
              bubbleCurve: Curves.easeIn,
              strokeColor: Colors.transparent,
              iconSize: 25.0,
              selectedColor: Colors.grey,
              unSelectedColor: Colors.grey[300],
              backgroundColor: Colors.white,
              borderRadius: Radius.circular(15.0),
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

/*


CustomNavigationBar(
        iconSize: 30.0,
        selectedColor: Color(0xff0c18fb),
        strokeColor: Color(0x300c18fb),
        unSelectedColor: Colors.grey[600],
        backgroundColor: Colors.white,
        borderRadius: Radius.circular(20.0),
        items: [
          CustomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
          ),
          CustomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
            ),
          ),
          CustomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
          ),
          CustomNavigationBarItem(
            icon: Icon(Icons.search),
          ),
          CustomNavigationBarItem(
            icon: Icon(Icons.people_alt),
          ),
        ],
        currentIndex: 1,
        onTap: (index) {},
        isFloating: true,
      ), */

/*

class NavBarView extends GetView<NavBarController> {
  const NavBarView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollerController scroller = Get.find<ScrollerController>();
    SizeConfig().init(context);
    return Scaffold(
      extendBody: true,
      body: Obx(
        () => NavBarApleeks(
          contents: [
            HomeView(),
            BillBoardView(),
            CommingView(),
            AccountView(),
          ],
          onTap: controller.selectCurrentIndex,
          currentIndex: controller.currentIndex,
          bottom: scroller.show ? 10.0 : -kToolbarHeight * 1.25,
          items: [
            NavBarItem(
              label: Text(
                "home".tr,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: getProportionateScreenHeight(10),
                ),
              ),
              icon: IconString.name(
                "home",
                size: 20.0,
                color: Colors.black87,
              ),
            ),
            NavBarItem(
              label: Text(
                "billboard".tr,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: getProportionateScreenHeight(10),
                ),
              ),
              icon: IconString.name(
                "movie",
                size: 20.0,
                color: Colors.black87,
              ),
            ),
            NavBarItem(
              label: Text(
                "comming".tr,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: getProportionateScreenHeight(10),
                ),
              ),
              icon: IconString.name(
                "calendar_today",
                size: 20.0,
                color: Colors.black87,
              ),
            ),
            NavBarItem(
              label: Text(
                "account".tr,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: getProportionateScreenHeight(10),
                ),
              ),
              icon: IconString.name(
                "account_circle",
                size: 20.0,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
