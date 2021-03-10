import 'package:autocinema/app/data/models/boleto_model.dart';
import 'package:autocinema/app/themes/adapt.dart';
import 'package:autocinema/app/utils/helper.dart';
import 'package:autocinema/app/widgets/Qr/qr_shared/share_qr_card.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoletoCard extends StatelessWidget {
  final BoletoModel boleto;
  const BoletoCard({
    Key key,
    this.boleto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.dialog(
        ShareQrCard(
          qrValue: QrCardModel(
            pelicula: boleto.titulo,
            fecha: boleto.diaLargo,
            numPersonas: boleto.extras,
            numVehiculos: boleto.vehiculos,
            titular: boleto.titular,
            total: double.parse(boleto.total),
            boletoQr: boleto.folioBoleto,
          ),
        ),
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CachedNetworkImage(
                    imageUrl: boleto.imagen,
                    imageBuilder: (context, image) => Container(
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.white,
                        backgroundImage: image,
                      ),
                    ),
                    placeholder: (context, url) => Container(
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.white,
                        backgroundImage: Image.asset("assets/images/cargando-imagen.png").image,
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.white,
                        backgroundImage:
                            Image.asset("assets/images/imagen-no-disponible.png").image,
                      ),
                    ),
                    fadeOutDuration: const Duration(milliseconds: 400),
                    fadeInDuration: const Duration(milliseconds: 800),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text(
                      boleto.titulo,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: Adapt.px(28),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    child: Text(
                      boleto.estatus ? 'Disponible' : 'Usado',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: boleto.estatus ? Colors.green : Theme.of(context).disabledColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      boleto.diaLargo.isEmpty
                          ? SizedBox.shrink()
                          : Container(
                              child: Text(
                                "Fecha: ${boleto.diaLargo} ${boleto.hora}",
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.8),
                                ),
                              ),
                            ),
                      SizedBox(
                        height: boleto.titulo.isEmpty ? 0 : 5,
                      ),
                      boleto.total.isEmpty
                          ? SizedBox.shrink()
                          : Container(
                              child: Text(
                                "Costo ${Helper.moneyFormat(double.parse(boleto.total))}",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ),
                            )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            boleto.estatus
                ? SizedBox.shrink()
                : Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            child: Text(
                              'Fecha de uso',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Theme.of(context).disabledColor,
                                fontWeight: FontWeight.bold,
                                fontSize: Adapt.px(22),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Text(
                            boleto.fechaUso,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: Adapt.px(22),
                            ),
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
