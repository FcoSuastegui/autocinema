import 'package:autocinema/app/data/domian/network.dart';
import 'package:autocinema/app/data/models/boleto_model.dart';
import 'package:autocinema/app/data/models/configuration_model.dart';
import 'package:autocinema/app/data/models/horary_model.dart';
import 'package:autocinema/app/data/models/list_page.dart';
import 'package:autocinema/app/data/models/movie_model.dart';
import 'package:autocinema/app/data/models/response_model.dart';
import 'package:autocinema/app/data/models/state_model.dart';

class AutoCinemaService {
  static Future<List<ConfigurationModel>> banners() async {
    List<ConfigurationModel> list = List<ConfigurationModel>();
    final response = await Network.i.post(
      route: '/v1/app/banners',
    );

    if (response.status) {
      response.data.forEach(
        (item) => list.add(ConfigurationModel.fromJson(item)),
      );
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

  static Future<List<HoraryModel>> horaries(int idmovie) async {
    List<HoraryModel> list = List<HoraryModel>();
    final response = await Network.i.post(
      route: '/v1/app/horary',
      data: {
        "id_movie": idmovie,
      },
    );
    if (response.status) {
      response.data.forEach(
        (item) => list.add(HoraryModel.fromJson(item)),
      );
    }
    return list;
  }

  static Future<List<StateModel>> states() async {
    List<StateModel> list = List<StateModel>();
    final response = await Network.i.post(
      route: '/v1/app/states',
      data: {
        "case": 12,
      },
    );
    if (response.status) {
      response.data.forEach(
        (item) => list.add(StateModel.fromJson(item)),
      );
    }
    return list;
  }

  static Future<ResponseModel> processPagoBackend(Map<String, dynamic> datos) async {
    return await Network.i.post(
      route: '/v1/app/comprar-boleto',
      data: datos,
    );
  }

  static Future<ListPage<BoletoModel>> boletos({int cliente = 0, int page = 1}) async {
    final List<BoletoModel> list = List<BoletoModel>();
    String message = "";
    final response = await Network.i.post(
      route: '/v1/app/boletos',
      data: {
        "cliente": cliente,
        "page": page,
      },
    );
    response.status
        ? response.data.forEach((e) => list.add(BoletoModel.fromJson(e)))
        : message = response.message;

    return ListPage<BoletoModel>(
      itemList: list,
      totalCount: list.length,
      message: message,
    );
  }
}
