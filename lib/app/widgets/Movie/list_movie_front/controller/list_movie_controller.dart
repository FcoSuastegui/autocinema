import 'package:autocinema/app/data/models/movie_model.dart';
import 'package:autocinema/app/data/services/autocinema_service.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ListMovieController extends GetxController {
  final int type;
  final String filter;

  ListMovieController({
    this.type = 1,
    this.filter = '',
  });
  @override
  void onInit() {
    movieController.addPageRequestListener((pageKey) {
      getCartelera(pageKey);
    });
    super.onInit();
  }

  static const _pageSize = 10;
  final PagingController<int, MovieModel> movieController = PagingController(firstPageKey: 1);
  Future<void> getCartelera(int pageKey) async {
    final movies = await AutoCinemaService.movies(
      type: type,
      page: pageKey,
    );
    if (movies.message.isEmpty) {
      final isLastPage = movies.itemList.length <= _pageSize;
      final movie = movies.itemList.where((e) {
        return e.titulo != filter;
      }).toList();
      isLastPage
          ? movieController.appendLastPage(movie)
          : movieController.appendPage(movie, pageKey + 1);
    } else {
      movieController.error = movies.message;
    }
  }
}
