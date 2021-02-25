import 'package:autocinema/app/globals/controller/scroll_bar_controller.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class NavBarController extends GetxController {
  NavBarController._internal();
  static NavBarController _instance = NavBarController._internal();
  static NavBarController get i => _instance;

  RxInt _currentIndex = 0.obs;
  int get currentIndex => _currentIndex.value;

  void selectCurrentIndex(int index) => _currentIndex.value = index;
  final scroll = Get.find<ScrollBarController>().scroll;

  RxBool _show = true.obs;
  bool get show => _show.value;

  void _listener() {
    if (scroll.position.userScrollDirection == ScrollDirection.reverse && _show.value) {
      _show.value = false;
    } else if (scroll.position.userScrollDirection == ScrollDirection.forward && !_show.value) {
      _show.value = true;
    }
  }

  @override
  void onInit() {
    scroll.addListener(_listener);
    super.onInit();
  }
}
