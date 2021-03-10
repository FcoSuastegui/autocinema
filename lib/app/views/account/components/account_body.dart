import 'package:autocinema/app/globals/controller/firebase_auth_controller.dart';
import 'package:autocinema/app/routes/routes.dart';
import 'package:autocinema/app/themes/adapt.dart';
import 'package:autocinema/app/utils/get_storage.dart';
import 'package:autocinema/app/widgets/Alerts/alert_actions.dart';
import 'package:autocinema/app/widgets/ListTile/list_tile_default.dart';
import 'package:autocinema/app/widgets/PdfViewer/pdf_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountBody extends StatelessWidget {
  const AccountBody();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListTileDefault(
            title: 'Boletos'.tr,
            trailing: Icon(
              Icons.qr_code,
              color: Colors.black26,
              size: Adapt.px(40),
            ),
            onTap: () => Routes.goToPage('/boleto'),
          ),
          SizedBox(
            height: Adapt.px(50),
          ),
          /* ListTileDefault(
            title: 'card'.tr,
            trailing: Icon(
              Icons.credit_card,
              color: Colors.black26,
              size: Adapt.px(40),
            ),
            onTap: () => Routes.goToPage('/card'),
          ),
          SizedBox(
            height: Adapt.px(50),
          ),
          ListTileDefault(
            title: 'card'.tr,
            trailing: Icon(
              Icons.credit_card,
              color: Colors.black26,
              size: Adapt.px(40),
            ),
            onTap: () => Get.to(
              PdfViewer(
                path: GetStorages.config.aviso,
                title: GetStorages.config.aviso,
              ),
            ),
          ),
          SizedBox(
            height: Adapt.px(50),
          ), */
          ListTileDefault(
            title: 'logout'.tr,
            trailing: Icon(
              Icons.chevron_right,
              color: Colors.black26,
              size: Adapt.px(40),
            ),
            onTap: _logout,
            border: false,
          ),
        ],
      ),
    );
  }

  Future<void> _logout() async {
    await Get.dialog(
      AlertAction(
        title: "¿Deseas salir de la aplicación?",
        onPressYes: () {
          FirebaseAuthController.i.signOut();
          GetStorages.clear();
          Get.offAllNamed('/login');
        },
      ),
    );
  }
}
/* 
  Future<void> _activarMembresia() async {
    GetStorages.inst.membresia
        ? Helper.success(message: "¡Su membresía ya esta activida!")
        : await Get.dialog(
            WillPopScope(
              onWillPop: () => Future.value(false),
              child: MembershipView(),
            ),
          );
  }

  Future<void> _contrasena() async {
    List social = ["Google", "Facebook", "Apple"];
    GetStorages.inst.signIn > 0
        ? await Get.dialog(
            AlertAction(
              title:
                  "Ha iniciado sesión con ${social[GetStorages.inst.signIn - 1]}, no se puede cambiar la contraseña",
              buttonLabelNo: 'Aceptar',
            ),
          )
        : Routes.routeNamed('/password');
  }

  Future<void> _logout() async {
    await Get.dialog(
      AlertAction(
        title: "¿Deseas salir de la aplicación?",
        onPressYes: () {
          FirebaseAuthController.i.signOut();
          GetStorages.inst.clear();
          Get.offAllNamed('/');
        },
      ),
    );
  }
}
 */
