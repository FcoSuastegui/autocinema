import 'package:autocinema/app/data/services/app_config_service.dart';
import 'package:autocinema/app/utils/storage.dart';
import 'package:get/get.dart';

class AppConfigController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  void getConfigBackend() {
    AppConfigService.getConfig().then((value) => Storage.config = value);
  }
}
