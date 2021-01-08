import 'package:autocinema/themes/size_config.dart';
import 'package:autocinema/views/comming/components/list_comming.dart';
import 'package:autocinema/views/comming/controller/comming_controller.dart';
import 'package:autocinema/widgets/AppBar/filter_bar.dart';
import 'package:autocinema/widgets/AppBar/sliverappbar_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CommingView extends StatelessWidget {
  const CommingView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        extendBody: true,
        body: SafeArea(
          bottom: false,
          child: GetBuilder<CommingController>(
            init: CommingController.i,
            builder: (controller) => CustomScrollView(
              controller: controller.scroller,
              slivers: [
                SliverPersistentHeader(
                  floating: true,
                  delegate: SliverAppBarDelegate(
                    minHeight: getProportionateScreenWidth(50),
                    maxHeight: getProportionateScreenWidth(50),
                    child: FilterBar(
                      title: "comming".tr,
                    ),
                  ),
                ),
                const ListComming(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
