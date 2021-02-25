import 'package:autocinema/app/data/domian/network.dart';
import 'package:autocinema/app/data/models/configuration_model.dart';
import 'package:autocinema/app/data/models/list_page.dart';
import 'package:autocinema/app/data/models/movie_model.dart';

class AutoCinemaService {
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
    final response = await Network.i.post(
      route: '/v1/app/trailer',
    );

    return response.status
        ? ConfigurationModel.fromJson(response.data)
        : ConfigurationModel.fromJson({});
  }

  static Future<ListPage<MovieModel>> movies({type = 1, int page = 1}) async {
    final List<MovieModel> list = List<MovieModel>();
    String message = "";
    final response = await Network.i.post(
      route: '/v1/app/movies',
      data: {
        "caso": type,
      },
    );
    response.status
        ? response.data.forEach((e) => list.add(MovieModel.fromJson(e)))
        : message = response.message;

    return ListPage<MovieModel>(
      itemList: list,
      totalCount: list.length,
      message: message,
    );
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
