import 'package:autocinema/app/routes/routes.dart';
import 'package:autocinema/app/themes/adapt.dart';
import 'package:autocinema/app/utils/helper.dart';
import 'package:autocinema/app/utils/storage.dart';
import 'package:autocinema/app/views/navbar/controller/nav_bar_controller.dart';
import 'package:autocinema/app/widgets/ListTile/list_tile_default.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountBody extends StatelessWidget {
  const AccountBody();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 30,
        left: 20,
        right: 20,
      ),
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
            title: Storage.auth ? 'logout'.tr : 'login'.tr,
            trailing: Icon(
              Icons.chevron_right,
              color: Colors.black26,
              size: Adapt.px(40),
            ),
            onTap: _actions,
            border: false,
          ),
        ],
      ),
    );
  }
}

Future<void> _actions() async {
  if (Storage.auth) {
    Helper.logout();
  } else {
    final auth = await Helper.login();
    if (auth) {
      final nav = Get.find<NavBarController>();
      nav.selectCurrentIndex(0);
    }
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
