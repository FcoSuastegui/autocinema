import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Helper {
  static final Helper _instancia = new Helper._internal();
  factory Helper() => _instancia;
  Helper._internal();

  // Mensajes de dialogo Success, Warning, Error
  static Future<void> success({
    String title: 'AutoCinema',
    @required String message,
    SnackPosition snackPosition = SnackPosition.TOP,
  }) async {
    if (!Get.isSnackbarOpen)
      Get.snackbar(
        title,
        message,
        backgroundColor: Colors.green.withOpacity(0.8),
        colorText: Colors.white,
        snackPosition: snackPosition,
      );
  }

  static Future<void> error({
    String title: 'AutoCinema',
    @required String message,
    SnackPosition snackPosition = SnackPosition.TOP,
  }) async {
    if (!Get.isSnackbarOpen)
      Get.snackbar(
        title,
        message,
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
        snackPosition: snackPosition,
      );
  }

  static Future<void> warning({
    String title: 'AutoCinema',
    @required String message,
    SnackPosition snackPosition = SnackPosition.TOP,
  }) async {
    if (!Get.isSnackbarOpen)
      Get.snackbar(
        title,
        message,
        backgroundColor: Colors.yellow.withOpacity(0.8),
        colorText: Colors.white,
        snackPosition: snackPosition,
      );
  }

  static Future<void> launchInBrowser(
    String url, {
    bool forceSafariVC = false,
  }) async {
    if (url.isURL) {
      try {
        await launch(url, forceSafariVC: forceSafariVC);
      } on PlatformException catch (e) {
        print(e);
        Helper.error(message: 'url-access'.tr + ' $url');
      } catch (e) {
        Helper.error(message: e.toString());
      }
    } else {
      Helper.error(message: 'url-valid'.tr);
    }
  }
}

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get allInCaps => this.toUpperCase();
  String get capitalizeFirstofEach => this.split(" ").map((str) => str.capitalize).join(" ");
}
