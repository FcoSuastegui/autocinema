import 'package:autocinema/app/data/models/horary_model.dart';
import 'package:autocinema/app/data/models/movie_model.dart';
import 'package:autocinema/app/data/services/autocinema_service.dart';
import 'package:get/get.dart';

class MovieDetailController extends GetxController {
  MovieModel movie = Get.arguments;

  RxList<HoraryModel> _horaries = List<HoraryModel>().obs;
  List<HoraryModel> get horaries => _horaries;

  @override
  void onInit() {
    getHoraries(movie.id);
    super.onInit();
  }

  Future<void> getHoraries(int idMovie) async {
    final response = await AutoCinemaService.horaries(idMovie);
    _horaries.clear();
    response.forEach((element) => _horaries.add(element));
  }
}
