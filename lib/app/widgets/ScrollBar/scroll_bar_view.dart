import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollBarView extends StatelessWidget {
  final Widget child;
  final bool isAlwaysShown;
  final ScrollController controller;

  const ScrollBarView({
    Key key,
    this.isAlwaysShown = false,
    this.child,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoScrollbar(
      isAlwaysShown: isAlwaysShown,
      controller: controller,
      child: child,
    );
  }
}
