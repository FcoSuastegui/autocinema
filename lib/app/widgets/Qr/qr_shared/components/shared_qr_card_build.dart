import 'package:autocinema/app/themes/app_theme.dart';
import 'package:autocinema/app/utils/storage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:autocinema/app/themes/adapt.dart';
import 'package:autocinema/app/widgets/Qr/qr_shared/controller/shared_qr_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';

class SharedQrCardBuild extends GetView<SharedQrCardController> {
  final String qrValue;
  const SharedQrCardBuild({
    this.qrValue,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: controller.width,
      height: controller.height * 1.3,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            Adapt.px(20),
          ),
        ),
      ),
      child: Screenshot(
        controller: controller.screenshotController,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: "${Storage.server}/storage/images/sistema/LogoExterno.png",
              imageBuilder: (context, image) => Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                height: controller.headerHeight * 0.6,
                decoration: BoxDecoration(
                  color: AppTheme.kPrimaryColor,
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: image,
                  ),
                ),
              ),
              placeholder: (context, url) => Container(
                width: Adapt.px(200),
                height: controller.headerHeight * 0.6,
                color: const Color(0xFFAABBCC),
              ),
              errorWidget: (context, url, error) => Container(
                width: Adapt.px(200),
                height: controller.headerHeight * 0.6,
                color: const Color(0xFFAABBCC),
              ),
              fadeOutDuration: const Duration(milliseconds: 400),
              fadeInDuration: const Duration(milliseconds: 800),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.red,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              "Película",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppTheme.kPrimaryColor,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              "Película Película PelículaPelículaPelículaPelícula PelículaPelícula",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              "Fecha",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppTheme.kPrimaryColor,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              "LUN, 01, MAR",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              "Titular",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppTheme.kPrimaryColor,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              "Francisco Javier Suastegui Rosales",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                          ),
                          Container(
                              child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Nùm. Vehículos",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.kPrimaryColor,
                                ),
                              ),
                              Text(
                                "1000",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.kPrimaryColor,
                                ),
                              ),
                            ],
                          )),
                          Container(
                            child: Text(
                              "Francisco Javier Suastegui Rosales",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ],
                      ),
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
                      data: qrValue,
                      size: Adapt.px(280),
                    ),
                  ),
                ],
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
                      style: TextStyle(
                        color: AppTheme.kPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    "1. Presenta este correo en taquilla, impreso o de forma digital.",
                    style: TextStyle(
                      fontSize: Adapt.px(25),
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                  Text(
                    "2. Recuerda estar 10 minutos antes de que comience la función.",
                    style: TextStyle(
                      fontSize: Adapt.px(25),
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                  Text(
                    "3. Recuerda cumplir con las medidas sanitarias y portar tu cubre boca en todo momento.",
                    style: TextStyle(
                      fontSize: Adapt.px(25),
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                  Text(
                    "4. Recue3rda sintonizar en tu radio la estacion 88.5 FM para escuchar la pelicula.",
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
    );
  }
}
