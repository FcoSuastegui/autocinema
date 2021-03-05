import 'package:autocinema/app/views/boleto/controller/boleto_controller.dart';
import 'package:get/get.dart';

class BoletoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BoletoController());
  }
}
