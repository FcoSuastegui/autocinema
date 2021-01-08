import 'package:autocinema/controllers/scroller_controller.dart';
import 'package:get/get.dart';

class AppBidings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScrollerController.i);
  }
}
