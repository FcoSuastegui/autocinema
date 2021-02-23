import 'package:autocinema/app/views/card/controller/card_controller.dart';
import 'package:get/get.dart';

class CardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CardController());
  }
}
