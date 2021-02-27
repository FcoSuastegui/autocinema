import 'package:autocinema/app/data/models/movie_model.dart';
import 'package:autocinema/app/data/services/autocinema_service.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomeController extends GetxController {
  HomeController._internal();
  static HomeController _instance = HomeController._internal();
  static HomeController get i => _instance;

  static const _pageSize = 10;

  final PagingController<int, MovieModel> carteleraController = PagingController(firstPageKey: 1);

  Future<void> getCartelera(int pageKey) async {
    final movies = await AutoCinemaService.movies(
      type: 1,
      page: pageKey,
    );
    if (movies.message.isEmpty) {
      final isLastPage = movies.itemList.length <= _pageSize;
      isLastPage
          ? carteleraController.appendLastPage(movies.itemList)
          : carteleraController.appendPage(movies.itemList, pageKey + 1);
    } else {
      carteleraController.error = movies.message;
    }
  }

  final PagingController<int, MovieModel> proximamentController = PagingController(firstPageKey: 1);

  Future<void> getProximamente(int pageKey) async {
    final movies = await AutoCinemaService.movies(
      type: 2,
      page: pageKey,
    );
    if (movies.message.isEmpty) {
      final isLastPage = movies.itemList.length <= _pageSize;
      isLastPage
          ? proximamentController.appendLastPage(movies.itemList)
          : proximamentController.appendPage(movies.itemList, pageKey + 1);
    } else {
      proximamentController.error = movies.message;
    }
  }

  RxBool _loading = false.obs;
  bool get loading => _loading.value;

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
    carteleraController.addPageRequestListener((pageKey) => getCartelera(pageKey));
    proximamentController.addPageRequestListener((pageKey) => getProximamente(pageKey));
    _loading(false);
  }

  Future<void> getTrailer() async {
    final trailer = await AutoCinemaService().trailer();
    stringKey.value = trailer.valor;
  }

  Future<void> getBanners() async {
    final list = await AutoCinemaService.banners();
    banners.clear();
    list.forEach((element) {
      banners.add(element.valor);
    });
  }
}
