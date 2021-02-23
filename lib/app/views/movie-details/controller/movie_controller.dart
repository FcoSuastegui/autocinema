import 'package:autocinema/app/data/models/movie_model.dart';
import 'package:get/get.dart';

class MovieController extends GetxController {
  MovieModel movie = Get.arguments;

  @override
  void onInit() {
    super.onInit();
  }
}
