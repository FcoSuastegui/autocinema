import 'package:autocinema/views/comming/controller/comming_controller.dart';
import 'package:autocinema/widgets/List/list_movie_apleeks.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListComming extends GetView<CommingController> {
  const ListComming({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListApleeks(
        loading: controller.loading,
        movies: controller.comming,
      ),
    );
  }
}
