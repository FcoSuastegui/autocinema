import 'package:autocinema/app/utils/get_storage.dart';
import 'package:autocinema/app/utils/helper.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:async';

class ConnectivityController extends GetxController {
  Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> subscription;

  @override
  Future<void> onInit() async {
    await initConnectivity();
    subscription = _connectivity.onConnectivityChanged.listen(_updateConnection);
    super.onInit();
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  Future<void> initConnectivity() async {
    try {
      print(" 12");
      ConnectivityResult result = await _connectivity.checkConnectivity();
      _pageConnection(result);
    } on PlatformException catch (e) {
      print(e.toString());
    }
  }

  Future<void> _pageConnection(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        GetStorages.page = '/nav-bar';
        break;
      case ConnectivityResult.none:
        GetStorages.page = '/no-wifi';
        break;
    }
  }

  Future<void> _updateConnection(ConnectivityResult result) async {
    print("12132123");
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        GetStorages.page = '/nav-bar';
        Get.offAllNamed(GetStorages.page);
        Helper.success(
          message: 'wifi'.tr,
        );
        break;
      case ConnectivityResult.none:
        GetStorages.page = '/no-wifi';
        Get.offAllNamed(
          GetStorages.page,
        );
        break;
    }
  }
}
