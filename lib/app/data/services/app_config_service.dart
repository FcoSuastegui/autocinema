import 'package:autocinema/app/data/domian/network.dart';
import 'package:autocinema/app/data/models/app_config_model.dart';

class AppConfigService {
  static Future<AppConfigModel> getConfig() async {
    final response = await Network.i.post(
      route: "/v1/app/app-configuration",
    );
    return response.status ? AppConfigModel.fromJson(response.data) : AppConfigModel.fromJson({});
  }
}
