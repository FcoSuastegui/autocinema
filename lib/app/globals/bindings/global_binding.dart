import 'package:autocinema/app/globals/controller/scroll_bar_controller.dart';
import 'package:autocinema/app/views/navbar/controller/nav_bar_controller.dart';
import 'package:get/get.dart';

class GlobalBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScrollBarController.i, fenix: true);
    Get.lazyPut(() => NavBarController.i, fenix: true);
  }
}
