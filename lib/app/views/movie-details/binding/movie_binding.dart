import 'package:autocinema/app/views/movie-details/controller/movie_controller.dart';
import 'package:get/get.dart';

class MovieBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MovieController());
  }
}
