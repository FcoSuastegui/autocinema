import 'package:autocinema/app/widgets/Dividers/divider_custom.dart';
import 'package:autocinema/app/widgets/ListTile/list_tile_default.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DividerCustom(
          width: 0.9,
          margin: 0.01,
        ),
        ListTileDefault(
          title: 'change-password'.tr,
          trailing: Icon(
            Icons.lock,
            color: Colors.black26,
            size: 18.0,
          ),
          onTap: () {},
        ),
        ListTileDefault(
          top: 20.0,
          title: 'my-cards'.tr,
          trailing: Icon(
            Icons.payment,
            color: Colors.black26,
            size: 18.0,
          ),
          onTap: () => Get.toNamed('/card'),
        ),
        ListTileDefault.switchTile(
          title: "receive-notifications".tr,
          value: true,
          onChange: (e) {},
        ),
        ListTileDefault(
          top: 10.0,
          title: 'logout'.tr,
          trailing: Icon(
            Icons.chevron_right,
            color: Colors.black26,
            size: 18.0,
          ),
          onTap: () {},
        ),
      ],
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
        : Get.toNamed('/password');
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
