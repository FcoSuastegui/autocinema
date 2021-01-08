import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class ScrollerController extends GetxController {
  ScrollerController._internal();
  static ScrollerController _instance = ScrollerController._internal();
  static ScrollerController get i => _instance;

  ScrollController scroller = ScrollController();

  RxBool _show = true.obs;
  bool get show => _show.value;

  @override
  void onInit() {
    scroller.addListener(_listener);
    super.onInit();
  }

  void _listener() {
    if (scroller.position.userScrollDirection == ScrollDirection.reverse && _show.value) {
      _show.value = false;
    } else if (scroller.position.userScrollDirection == ScrollDirection.forward && !_show.value) {
      _show.value = true;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
