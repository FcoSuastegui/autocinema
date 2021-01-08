import 'package:autocinema/views/navbar/controller/nav_bar_controller.dart';
import 'package:get/get.dart';

class NavBarBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavBarController.i);
  }
}
