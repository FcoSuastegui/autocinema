import 'package:autocinema/app/globals/controller/firebase_auth_controller.dart';
import 'package:autocinema/app/utils/storage.dart';
import 'package:autocinema/app/views/login/login_view.dart';
import 'package:autocinema/app/views/navbar/controller/nav_bar_controller.dart';
import 'package:autocinema/app/widgets/Alerts/alert_actions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class Helper {
  static final Helper _instancia = Helper._internal();
  factory Helper() => _instancia;
  Helper._internal();

  static Future<void> launchInBrowser(String url) async {
    url.isURL
        ? await canLaunch(url)
            ? await launch(url, forceSafariVC: false)
            : Helper.error(message: 'No se pudo acceder a esta url $url')
        : Helper.error(message: 'Favor de ingresar una url valida');
  }

  static Future<void> success({
    String title: 'AutoCinema',
    @required String message,
    int duration = 1500,
  }) async {
    if (!Get.isSnackbarOpen) {
      Get.snackbar(
        title,
        message,
        duration: Duration(milliseconds: duration),
        backgroundColor: Colors.green.withOpacity(0.8),
        colorText: Colors.white,
      );
    }
  }

  static Future<void> error({
    String title: 'AutoCinema',
    @required String message,
    int duration = 1500,
  }) async {
    if (!Get.isSnackbarOpen) {
      Get.snackbar(
        title,
        message,
        duration: Duration(milliseconds: duration),
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
      );
    }
  }

  static Future<void> warning({
    String title: 'AutoCinema',
    @required String message,
    int duration = 1500,
  }) async {
    if (!Get.isSnackbarOpen) {
      Get.snackbar(
        title,
        message,
        duration: Duration(milliseconds: duration),
        backgroundColor: Colors.yellow.withOpacity(0.8),
        colorText: Colors.white,
      );
    }
  }

  static Future<void> logout() async {
    await Get.dialog(
      AlertAction(
        title: "¿Deseas cerrar sesión?",
        onPressYes: () {
          FirebaseAuthController.i.signOut();
          Storage.clear();
          final nav = Get.find<NavBarController>();
          nav.selectCurrentIndex(0);
          Get.back();
        },
      ),
    );
  }

  static Future<bool> login() async {
    final result = await Get.to(
      () => LoginView(),
      fullscreenDialog: true,
    );
    return result != null ? result : false;
  }

  static String moneyFormat(dynamic money) {
    final formatCurrency = NumberFormat.simpleCurrency();
    return formatCurrency.format(money);
  }

  static String dateTimeFormat() {
    DateTime now = DateTime.now();
    return DateFormat('yyyy-MM-dd – kk:mm').format(now);
  }

  static int numeric(String s) => _isNumeric(s) ? int.parse(s) : s;
  static bool _isNumeric(String s) => s == null ? false : double.parse(s, (e) => null) != null;
}
