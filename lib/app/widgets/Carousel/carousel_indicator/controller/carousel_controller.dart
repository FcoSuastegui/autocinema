import 'package:get/get.dart';

class CarouselIndicatorController extends GetxController {
  RxInt _currenIndex = 0.obs;
  int get currentIndex => _currenIndex.value;
  set currentIndex(int index) => _currenIndex(index);

  @override
  void onInit() {
    _currenIndex.value = 0;
    super.onInit();
  }
}
