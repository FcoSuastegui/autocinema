import 'package:get/get.dart';

class NavBarController extends GetxController {
  NavBarController._internal();
  static NavBarController _instance = NavBarController._internal();
  static NavBarController get i => _instance;

  RxInt _currentIndex = 0.obs;
  int get currentIndex => _currentIndex.value;

  void selectCurrentIndex(int index) => _currentIndex.value = index;

  @override
  void onInit() {
    super.onInit();
  }
}
