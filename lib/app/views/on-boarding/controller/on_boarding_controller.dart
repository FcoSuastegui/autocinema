import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  int _numPages = 3;
  int get numbPages => _numPages;

  RxInt _currentPage = 0.obs;
  RxInt get currentPage => _currentPage;

  final PageController _pageViewController = PageController(initialPage: 0);
  PageController get pageViewController => _pageViewController;

  void onPageChanged(int page) => _currentPage.value = page;

  bool onPressed() {
    if (_pageViewController.page > 1) {
      return true;
    }
    _pageViewController.nextPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
    return false;
  }

  @override
  void onInit() {
    super.onInit();
  }
}
