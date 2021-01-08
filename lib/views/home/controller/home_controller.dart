import 'package:autocinema/controllers/scroller_controller.dart';
import 'package:autocinema/data/models/movie_model.dart';
import 'package:autocinema/data/services/autocinema_service.dart';
import 'package:autocinema/helpers/get_storages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController._internal();
  static HomeController _instance = HomeController._internal();
  static HomeController get i => _instance;

  final ScrollController scroller = Get.find<ScrollerController>().scroller;

  RxBool _loading = false.obs;
  bool get loading => _loading.value;

  RxList<MovieModel> cartelera = List<MovieModel>().obs;
  RxList<MovieModel> proximamente = List<MovieModel>().obs;
  RxList<String> banners = List<String>().obs;
  RxString stringKey = ''.obs;

  @override
  void onInit() async {
    init();
    super.onInit();
  }

  Future<void> init() async {
    _loading(true);
    await getTrailer();
    await getBanners();
    await getCartelera();
    await getProximamente();
    _loading(false);
  }

  Future<void> getTrailer() async {
    final trailer = await AutoCinemaService().trailer();
    stringKey.value = trailer.valor;
  }

  Future<void> getBanners() async {
    final list = await AutoCinemaService().banners();
    list.forEach((element) {
      final item = "${GetStorages.i.server}/storage/images/banners/${element.valor}";
      banners.add(item);
    });
  }

  Future<void> getCartelera() async {
    final list = await AutoCinemaService().cartelera();
    list.forEach((element) {
      cartelera.add(element);
    });
  }

  Future<void> getProximamente() async {
    final list = await AutoCinemaService().proximamente();
    list.forEach((element) {
      proximamente.add(element);
    });
  }
}
