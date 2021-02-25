import 'package:autocinema/app/data/models/movie_model.dart';
import 'package:autocinema/app/data/services/autocinema_service.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class BillBoardController extends GetxController {
  BillBoardController._internal();
  static BillBoardController _instance = BillBoardController._internal();
  static BillBoardController get i => _instance;

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

  @override
  void onInit() {
    carteleraController.addPageRequestListener((pageKey) => getCartelera(pageKey));
    super.onInit();
  }
}
