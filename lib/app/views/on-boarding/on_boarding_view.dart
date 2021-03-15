import 'package:autocinema/app/data/models/user_model.dart';
import 'package:autocinema/app/themes/adapt.dart';
import 'package:autocinema/app/themes/app_theme.dart';
import 'package:autocinema/app/utils/storage.dart';
import 'package:autocinema/app/views/navbar/controller/nav_bar_controller.dart';
import 'package:autocinema/app/views/on-boarding/components/on_boarding_content.dart';
import 'package:autocinema/app/views/on-boarding/components/on_boarding_stepper.dart';
import 'package:autocinema/app/views/on-boarding/controller/on_boarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingView extends GetView<OnBoardingController> {
  static final String routeName = '/';
  const OnBoardingView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Adapt.initContext(context);
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          PageView(
            onPageChanged: controller.onPageChanged,
            controller: controller.pageViewController,
            children: [
              OnBoardingContent(
                slide: "assets/slides/slide-01.png",
                title: "Bienvenido a princess golf".toUpperCase(),
                marginVertical: 220,
              ),
              OnBoardingContent(
                slide: "assets/slides/slide-02.png",
                title: "Descuber el privilegio de jugar".toUpperCase(),
                subtitle: "Horarios-Reservas \n Score Cards-Servicios Exclusivo".toUpperCase(),
              ),
              OnBoardingContent(
                slide: "assets/slides/slide-03.png",
                title: "Privilegios exclusivos en nuestros hoteles.".toUpperCase(),
                subtitle:
                    "Entrar a un mundo de privelgios\n y experiencias en  hotelería de clase mundial."
                        .toUpperCase(),
              )
            ],
          ),
          Obx(
            () => Container(
              padding: EdgeInsets.all(24.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: OnBoardingStepper(
                      pages: controller.numbPages,
                      currentPage: controller.currentPage.value,
                    ),
                  ),
                  ClipOval(
                    child: Container(
                      color: Colors.white,
                      child: IconButton(
                        icon: Icon(
                            controller.currentPage.value >= 2 ? Icons.done : Icons.trending_flat,
                            color: AppTheme.kPrimaryColor),
                        onPressed: () {
                          final respuesta = controller.onPressed();
                          if (respuesta) {
                            final nav = Get.find<NavBarController>();
                            nav.selectCurrentIndex(0);
                            Storage.page = '/nav-bar';
                            Storage.user = UserModel.fromJson({});
                            Get.offAllNamed(Storage.page);
                          }
                        },
                        padding: EdgeInsets.all(13.0),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
