import 'package:autocinema/app/themes/adapt.dart';
import 'package:autocinema/app/themes/app_theme.dart';
import 'package:autocinema/app/utils/get_storage.dart';
import 'package:autocinema/app/views/navbar/controller/nav_bar_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavBarItems extends GetView<NavBarController> {
  const NavBarItems({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomNavigationBar(
        elevation: 8.0,
        bubbleCurve: Curves.easeIn,
        strokeColor: Colors.transparent,
        iconSize: Adapt.px(30),
        selectedColor: AppTheme.kPrimaryColor,
        unSelectedColor: Colors.grey[300],
        backgroundColor: Colors.white,
        borderRadius: Radius.circular(
          Adapt.px(20),
        ),
        items: getItems(),
        currentIndex: controller.currentIndex,
        onTap: controller.selectCurrentIndex,
        isFloating: true,
      ),
    );
  }

  List<CustomNavigationBarItem> getItems() {
    final user = GetStorages.i.user;
    List<CustomNavigationBarItem> item = [
      CustomNavigationBarItem(
        title: Text(
          "home".tr,
          style: TextStyle(
            fontSize: Adapt.px(25),
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        icon: Icon(Icons.home),
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
            fontSize: Adapt.px(25),
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        icon: user.photo != null && user.photo.isNotEmpty
            ? CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(
                  GetStorages.i.user.photo,
                ),
              )
            : Icon(Icons.account_circle),
      ),
    ];
    /* 
    switch (user.rol) {
      case 'Admin':
        break;
      case 'Empleado':
        item.insertAll(0, [
          CustomNavigationBarItem(
            title: Text(
              "home".tr,
              style: TextStyle(
                fontSize: Adapt.px(25),
              ),
            ),
            icon: Icon(Icons.home),
          ),
        ]);
        break;
      case 'Visitante':
        item.insertAll(0, [
          CustomNavigationBarItem(
            title: Text(
              "home".tr,
              style: TextStyle(
                fontSize: Adapt.px(25),
              ),
            ),
            icon: Icon(Icons.home),
          ),
          CustomNavigationBarItem(
            title: Text(
              "coupon".tr,
              style: TextStyle(
                fontSize: Adapt.px(25),
              ),
            ),
            icon: Icon(Icons.card_membership),
          ),
        ]);
        break;
    } */
    return item;
  }
}
