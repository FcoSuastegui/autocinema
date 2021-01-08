import 'package:autocinema/helpers/get_storages.dart';
import 'package:autocinema/helpers/helper.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:async';

class ConnectivityController extends GetxController {
  ConnectivityController._internal();
  static ConnectivityController _instance = ConnectivityController._internal();
  static ConnectivityController get i => _instance;

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
        GetStorages.i.page = '/nav-bar';
        break;
      case ConnectivityResult.none:
        GetStorages.i.page = '/no-wifi';
        break;
    }
  }

  Future<void> _updateConnection(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        GetStorages.i.page = '/nav-bar';
        Get.offAllNamed(GetStorages.i.page);
        Helper.success(
          message: 'wifi'.tr,
        );
        break;
      case ConnectivityResult.none:
        GetStorages.i.page = '/no-wifi';
        Get.offAllNamed(
          GetStorages.i.page,
        );
        break;
    }
  }
}
