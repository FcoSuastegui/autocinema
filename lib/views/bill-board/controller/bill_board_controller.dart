import 'package:autocinema/controllers/scroller_controller.dart';
import 'package:autocinema/data/models/movie_model.dart';
import 'package:autocinema/data/services/autocinema_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BillBoardController extends GetxController {
  BillBoardController._internal();
  static BillBoardController _instance = BillBoardController._internal();
  static BillBoardController get i => _instance;

  RxList<MovieModel> cartelera = List<MovieModel>().obs;

  RxBool _loading = false.obs;
  bool get loading => _loading.value;

  final ScrollController scroller = Get.find<ScrollerController>().scroller;

  @override
  void onInit() {
    getCartelera();
    super.onInit();
  }

  Future<void> getCartelera() async {
    _loading(true);
    final list = await AutoCinemaService().cartelera();
    list.forEach((element) {
      cartelera.add(element);
    });
    _loading(false);
  }
}
