import 'package:autocinema/app/globals/controller/scroll_bar_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScrollBarView extends GetView<ScrollBarController> {
  final Widget child;
  final bool isAlwaysShown;

  const ScrollBarView({
    Key key,
    this.isAlwaysShown = false,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoScrollbar(
      isAlwaysShown: isAlwaysShown,
      controller: controller.scroll,
      child: child,
    );
  }
}
