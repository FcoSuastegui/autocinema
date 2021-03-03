import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:autocinema/app/themes/adapt.dart';
import 'package:autocinema/app/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';

class SharedQrCardController extends GetxController {
  SharedQrCardController._internal();
  static SharedQrCardController _instance = SharedQrCardController._internal();
  static get i => _instance;

  ScreenshotController screenshotController = ScreenshotController();
  double width = (Adapt.screenWidth - Adapt.px(60)).floorToDouble();
  double height = (Adapt.screenHeight / 1.5).floorToDouble();
  double headerHeight = 0.0;

  @override
  void onInit() {
    headerHeight = ((width - Adapt.px(40)) / 2).floorToDouble();
    super.onInit();
  }

  void shareTapped() {
    /* screenshotController.capture().then((Uint8List image) async {
      print("object");
      //ShareExtend.share(image.path, "image");
    }).catchError((onError) {
      print(onError);
    }); */
  }

  Future captureAndSharePng({BuildContext context, GlobalKey key}) async {
    try {
      RenderRepaintBoundary boundary = key.currentContext.findRenderObject();
      var image = await boundary.toImage();
      ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();

      final file = File.fromRawPath(pngBytes);

      final RenderBox box = context.findRenderObject();
      print(file.path);
      await Share.shareFiles(
        [file.path],
        text: "Cupones Qr",
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
      );
    } catch (e) {
      Helper.error(message: e.toString());
    }
  }
}
