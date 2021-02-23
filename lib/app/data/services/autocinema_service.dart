import 'package:autocinema/app/data/domian/network.dart';
import 'package:autocinema/app/data/models/configuration_model.dart';
import 'package:autocinema/app/data/models/movie_model.dart';
import 'package:autocinema/app/utils/get_storage.dart';

class AutoCinemaService {
  String pathImage = "${GetStorages.i.server}/storage/images";

  Future<List<ConfigurationModel>> banners() async {
    List<ConfigurationModel> list = List<ConfigurationModel>();
    final response = await Network.i.post(
      route: '/v1/app/banners',
    );

    if (response.status) {
      response.data.forEach((item) => list.add(ConfigurationModel.fromJson(item)));
    }
    return list;
  }

  Future<ConfigurationModel> trailer() async {
    ConfigurationModel trailer;

    final response = await Network.i.post(
      route: '/v1/app/trailer',
    );

    if (response.status) {
      trailer = ConfigurationModel.fromJson(response.data);
    }

    return trailer;
  }

  Future<List<MovieModel>> cartelera() async {
    List<MovieModel> list = List<MovieModel>();

    final response = await Network.i.post(
      route: '/v1/app/movies',
      data: {
        "caso": 1,
      },
    );

    if (response.status) {
      response.data.forEach((item) => list.add(MovieModel.fromJson(item)));
    }

    return list;
  }

  Future<List<MovieModel>> proximamente() async {
    List<MovieModel> list = List<MovieModel>();

    final response = await Network.i.post(
      route: '/v1/app/movies',
      data: {
        "caso": 2,
      },
    );

    if (response.status) {
      response.data.forEach((item) => list.add(MovieModel.fromJson(item)));
    }

    return list;
  }
}
