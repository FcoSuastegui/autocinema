import 'package:autocinema/app/globals/controller/scroll_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SliverScrollView extends StatelessWidget {
  final Function onRefresh;
  final List<Widget> slivers;
  final ScrollController controller;
  final bool reverse;
  final ScrollPhysics physics;

  const SliverScrollView({
    Key key,
    this.onRefresh,
    this.slivers = const <Widget>[],
    this.controller,
    this.reverse = false,
    this.physics,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = Get.find<ScrollBarController>().scroll;
    return RefreshIndicator(
      strokeWidth: 1.0,
      onRefresh: onRefresh ?? () => Future.sync(() {}),
      child: CustomScrollView(
        physics: physics,
        reverse: reverse,
        controller: controller ?? scrollController,
        slivers: slivers,
      ),
    );
  }
}
