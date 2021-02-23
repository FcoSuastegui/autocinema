import 'package:autocinema/app/themes/adapt.dart';
import 'package:autocinema/app/views/navbar/components/nar_bar_items.dart';
import 'package:autocinema/app/views/navbar/components/nav_bar_pages.dart';
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

    return Scaffold(
      body: const NavBarPages(),
      extendBody: true,
      bottomNavigationBar: Obx(
        () => AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          child: controller.show
              ? Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: Adapt.px(25),
                  ),
                  child: const NavBarItems(),
                )
              : SizedBox.shrink(),
        ),
      ),
    );
  }
}
