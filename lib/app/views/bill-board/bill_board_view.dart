import 'package:autocinema/app/themes/adapt.dart';
import 'package:autocinema/app/widgets/AppBar/filter_bar.dart';
import 'package:autocinema/app/views/bill-board/components/list_bill_board.dart';
import 'package:autocinema/app/views/bill-board/controller/bill_board_controller.dart';
import 'package:autocinema/app/widgets/AppBar/sliverappbar_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BillBoardView extends StatelessWidget {
  const BillBoardView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        extendBody: true,
        body: SafeArea(
          bottom: false,
          child: GetBuilder<BillBoardController>(
            init: BillBoardController.i,
            builder: (controller) => CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                  floating: true,
                  delegate: SliverAppBarDelegate(
                    minHeight: Adapt.px(50),
                    maxHeight: Adapt.px(50),
                    child: FilterBar(
                      title: "billboard".tr,
                    ),
                  ),
                ),
                ListBillBoard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
