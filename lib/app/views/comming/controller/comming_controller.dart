import 'package:autocinema/app/data/models/movie_model.dart';
import 'package:autocinema/app/data/services/autocinema_service.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CommingController extends GetxController {
  CommingController._internal();
  static CommingController _instance = CommingController._internal();
  static CommingController get i => _instance;

  static const _pageSize = 10;
  final PagingController<int, MovieModel> commingController = PagingController(firstPageKey: 1);

  Future<void> getCartelera(int pageKey) async {
    final movies = await AutoCinemaService.movies(
      type: 2,
      page: pageKey,
    );
    if (movies.message.isEmpty) {
      final isLastPage = movies.itemList.length <= _pageSize;
      isLastPage
          ? commingController.appendLastPage(movies.itemList)
          : commingController.appendPage(movies.itemList, pageKey + 1);
    } else {
      commingController.error = movies.message;
    }
  }

  @override
  void onInit() {
    commingController.addPageRequestListener((pageKey) => getCartelera(pageKey));
    super.onInit();
  }
}
