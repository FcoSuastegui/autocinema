import 'package:autocinema/app/themes/adapt.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_extend/share_extend.dart';

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

  Future<void> shareTapped() async {
    try {
      final file = await screenshotController.capture(
        pixelRatio: 1.5,
      );
      ShareExtend.share(
        file.path,
        "image",
        extraText: "Cupon Qr -",
      );
    } catch (e) {
      print(e);
    }
  }
}
