import 'package:autocinema/views/bill-board/controller/bill_board_controller.dart';
import 'package:autocinema/widgets/List/list_movie_apleeks.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListBillBoard extends GetView<BillBoardController> {
  const ListBillBoard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListApleeks(
        loading: controller.loading,
        movies: controller.cartelera,
      ),
    );
  }
}
