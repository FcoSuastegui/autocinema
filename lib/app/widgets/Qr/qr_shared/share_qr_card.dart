import 'package:autocinema/app/themes/adapt.dart';
import 'package:autocinema/app/themes/app_theme.dart';
import 'package:autocinema/app/utils/helper.dart';
import 'package:autocinema/app/utils/storage.dart';
import 'package:autocinema/app/widgets/Qr/qr_shared/controller/shared_qr_card_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';

class QrCardModel {
  String pelicula;
  String fecha;
  String titular;
  int numVehiculos;
  int numPersonas;
  double total;
  String boletoQr;

  QrCardModel({
    this.pelicula,
    this.fecha,
    this.titular,
    this.numPersonas,
    this.numVehiculos,
    this.total,
    this.boletoQr,
  });
}

class ShareQrCard extends StatelessWidget {
  final QrCardModel qrValue;
  const ShareQrCard({
    Key key,
    this.qrValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SharedQrCardController>(
      init: SharedQrCardController.i,
      builder: (c) => Screenshot(
        controller: c.screenshotController,
        child: SimpleDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              Adapt.px(20),
            ),
          ),
          backgroundColor: Colors.white,
          titlePadding: EdgeInsets.zero,
          title: CachedNetworkImage(
            imageUrl: "${Storage.server}/storage/images/sistema/LogoExterno.png",
            imageBuilder: (context, image) => Container(
              width: double.infinity,
              height: c.headerHeight * 0.5,
              decoration: BoxDecoration(
                color: AppTheme.kPrimaryColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(
                    Adapt.px(20),
                  ),
                ),
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: image,
                ),
              ),
            ),
            placeholder: (context, url) => Container(
              height: c.headerHeight * 0.5,
              decoration: BoxDecoration(
                color: const Color(0xFFAABBCC),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(
                    Adapt.px(20),
                  ),
                ),
              ),
            ),
            errorWidget: (context, url, error) => Container(
              height: c.headerHeight * 0.5,
              decoration: BoxDecoration(
                color: const Color(0xFFAABBCC),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(
                    Adapt.px(20),
                  ),
                ),
              ),
            ),
            fadeOutDuration: const Duration(milliseconds: 400),
            fadeInDuration: const Duration(milliseconds: 800),
          ),
          children: [
            Container(
              width: c.width,
              height: c.height,
              child: Column(
                children: [
                  Container(
                    height: c.height * 0.9,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Text(
                                              "Pel??cula",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: AppTheme.kPrimaryColor,
                                                fontSize: Adapt.px(25),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                              qrValue.pelicula,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: TextStyle(
                                                color: Colors.black.withOpacity(0.5),
                                                fontSize: Adapt.px(25),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Text(
                                              "Fecha",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: AppTheme.kPrimaryColor,
                                                fontSize: Adapt.px(25),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            qrValue.fecha,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: TextStyle(
                                              color: Colors.black.withOpacity(0.5),
                                              fontSize: Adapt.px(25),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  child: Text(
                                    "Titular",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppTheme.kPrimaryColor,
                                      fontSize: Adapt.px(25),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    qrValue.titular,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                      fontSize: Adapt.px(25),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Text(
                                              "N??m. veh??culos",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: AppTheme.kPrimaryColor,
                                                fontSize: Adapt.px(25),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                              qrValue.numVehiculos.toString(),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: TextStyle(
                                                color: Colors.black.withOpacity(0.5),
                                                fontSize: Adapt.px(25),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Text(
                                              "N??m. P. extras",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: AppTheme.kPrimaryColor,
                                                fontSize: Adapt.px(25),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            qrValue.numPersonas.toString(),
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.end,
                                            maxLines: 1,
                                            style: TextStyle(
                                              color: Colors.black.withOpacity(0.5),
                                              fontSize: Adapt.px(25),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Text(
                                              "Costo",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: AppTheme.kPrimaryColor,
                                                fontSize: Adapt.px(25),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                              Helper.moneyFormat(qrValue.total),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: TextStyle(
                                                fontSize: Adapt.px(25),
                                                color: Colors.black.withOpacity(0.5),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Text(
                                              "Boleto QR",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: AppTheme.kPrimaryColor,
                                                fontSize: Adapt.px(25),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            qrValue.boletoQr,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: TextStyle(
                                              fontSize: Adapt.px(25),
                                              color: Colors.black.withOpacity(0.5),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(
                                  Adapt.px(20),
                                ),
                              ),
                            ),
                            alignment: Alignment.center,
                            child: QrImage(
                              backgroundColor: Colors.white,
                              data: qrValue.boletoQr,
                              size: Adapt.px(350),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Column(
                              children: [
                                Container(
                                  child: Text(
                                    "Instrucciones de uso y recomendaciones",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AppTheme.kPrimaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: Adapt.px(25),
                                    ),
                                  ),
                                ),
                                Text(
                                  "1. Presenta este correo en taquilla, impreso o de forma digital.",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: Adapt.px(25),
                                    color: Colors.black.withOpacity(0.7),
                                  ),
                                ),
                                Text(
                                  "2. Recuerda estar 10 minutos antes de que comience la funci??n.",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: Adapt.px(25),
                                    color: Colors.black.withOpacity(0.7),
                                  ),
                                ),
                                Text(
                                  "3. Recuerda cumplir con las medidas sanitarias y portar tu cubre boca en todo momento.",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: Adapt.px(25),
                                    color: Colors.black.withOpacity(0.7),
                                  ),
                                ),
                                Text(
                                  "4. Recuerda sintonizar en tu radio la estaci??n 88.5 FM para escuchar la pel??cula.",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: Adapt.px(25),
                                    color: Colors.black.withOpacity(0.7),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: GestureDetector(
                            onTap: () => c.shareTapped(),
                            child: SizedBox(
                              width: Adapt.px(200),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.share),
                                  Text(
                                    'share'.tr,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: Adapt.px(28),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
