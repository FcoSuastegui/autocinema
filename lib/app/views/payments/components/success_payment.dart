import 'package:autocinema/app/themes/adapt.dart';
import 'package:autocinema/app/themes/app_theme.dart';
import 'package:autocinema/app/utils/helper.dart';
import 'package:autocinema/app/views/payments/bloc/payments_bloc.dart';
import 'package:autocinema/app/widgets/Qr/qr_shared/share_qr_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';

class SuccessPayments extends StatelessWidget {
  const SuccessPayments({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final bloc = BlocProvider.of<PaymentsBloc>(context);
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 70,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    child: Text(
                      "¡Compra exitosa!",
                      style: TextStyle(
                        fontSize: Adapt.px(35),
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Text(
              "Tu boleto se ha enviado al correo registrado.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: Adapt.px(30),
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "Titular:",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.8),
                          fontSize: Adapt.px(27),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Información de la compra:",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.8),
                          fontSize: Adapt.px(27),
                          fontWeight: FontWeight.bold,
                        ),
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
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.person_outline,
                              size: Adapt.px(36),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Text(
                                bloc.titular.value,
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.8),
                                  fontSize: Adapt.px(27),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Folio: ${9099230239}",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.8),
                          fontSize: Adapt.px(27),
                        ),
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
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.mail_outline,
                              size: Adapt.px(36),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Text(
                                bloc.email.value,
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.8),
                                  fontSize: Adapt.px(27),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        "01/03/2012 - 11:59:28",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.8),
                          fontSize: Adapt.px(27),
                        ),
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
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.phone,
                              size: Adapt.px(36),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Text(
                                bloc.phone.value,
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.8),
                                  fontSize: Adapt.px(27),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        Helper.moneyFormat(bloc.total),
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.8),
                          fontSize: Adapt.px(27),
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: 30,
                  color: Colors.black,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "Boleto vehicular - ${bloc.c.horary.fechaLarga} - ${bloc.c.horary.hora}",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: Adapt.px(25),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            "${bloc.c.movie.titulo}",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.8),
                              fontSize: Adapt.px(25),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            child: Text(
                              "${bloc.c.vehiculo} X ${Helper.moneyFormat(double.parse(bloc.c.horary.tarifa))}",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.8),
                                fontSize: Adapt.px(25),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            child: Text(
                              Helper.moneyFormat(bloc.c.totalXvehiculo),
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.8),
                                fontSize: Adapt.px(27),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                bloc.c.persona > 0
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Text(
                              "Boleto Persona Extra - ${bloc.c.horary.fechaLarga} - ${bloc.c.horary.hora}",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: Adapt.px(25),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  "${bloc.c.movie.titulo}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.8),
                                    fontSize: Adapt.px(25),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                  child: Text(
                                    "${bloc.c.persona} X ${Helper.moneyFormat(double.parse(bloc.c.horary.tarifaExtras))}",
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.8),
                                      fontSize: Adapt.px(25),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                  child: Text(
                                    Helper.moneyFormat(bloc.c.totalXpersona),
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.8),
                                      fontSize: Adapt.px(25),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    : SizedBox.shrink(),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      child: Text(
                        "Total",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.8),
                          fontWeight: FontWeight.bold,
                          fontSize: Adapt.px(30),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      child: Text(
                        Helper.moneyFormat(bloc.total),
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.8),
                          fontSize: Adapt.px(30),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            alignment: Alignment.bottomRight,
            child: FlatButton(
              child: Text(
                "Ver boleto",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => Get.dialog(
                ShareQrCard(
                  qrValue: QrCardModel(
                    pelicula: bloc.c.movie.titulo,
                    fecha: bloc.c.horary.fechaCorta,
                    numPersonas: bloc.c.persona,
                    numVehiculos: bloc.c.vehiculo,
                    titular: bloc.titular.value,
                    total: bloc.c.totalC,
                    boletoQr: bloc.folios['folioQr'] ?? '',
                  ),
                ),
              ),
              color: AppTheme.kPrimaryColor,
            ),
          )
        ],
      ),
    );
  }
}
