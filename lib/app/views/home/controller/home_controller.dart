import 'package:autocinema/app/data/models/movie_model.dart';
import 'package:autocinema/app/data/services/autocinema_service.dart';
import 'package:autocinema/app/utils/get_storage.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController._internal();
  static HomeController _instance = HomeController._internal();
  static HomeController get i => _instance;

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
