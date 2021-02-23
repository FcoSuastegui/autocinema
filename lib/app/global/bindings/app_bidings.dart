import 'package:autocinema/app/global/controller/scroll_bar_controller.dart';
import 'package:get/get.dart';

class AppBidings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScrollBarController.i);
  }
}
