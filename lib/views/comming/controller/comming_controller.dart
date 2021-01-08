import 'package:autocinema/controllers/scroller_controller.dart';
import 'package:autocinema/data/models/movie_model.dart';
import 'package:autocinema/data/services/autocinema_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommingController extends GetxController {
  CommingController._internal();
  static CommingController _instance = CommingController._internal();
  static CommingController get i => _instance;

  RxList<MovieModel> comming = List<MovieModel>().obs;

  RxBool _loading = false.obs;
  bool get loading => _loading.value;

  final ScrollController scroller = Get.find<ScrollerController>().scroller;

  @override
  void onInit() {
    getProximamente();
    super.onInit();
  }

  Future<void> getProximamente() async {
    _loading(true);
    final list = await AutoCinemaService().proximamente();
    list.forEach((element) {
      comming.add(element);
    });
    _loading(false);
  }
}
