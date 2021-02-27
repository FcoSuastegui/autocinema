import 'package:autocinema/app/views/movie-details/controller/movie_detail_controller.dart';
import 'package:get/get.dart';

class MovieDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MovieDetailController());
  }
}
