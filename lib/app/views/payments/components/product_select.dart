import 'package:autocinema/app/data/models/zone_model.dart';
import 'package:autocinema/app/themes/adapt.dart';
import 'package:autocinema/app/utils/helper.dart';
import 'package:autocinema/app/views/payments/bloc/payments_bloc.dart';
import 'package:autocinema/app/views/payments/controller/payments_controller.dart';
import 'package:autocinema/app/widgets/TextField/numeric_step_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';

class ProductSelected extends GetView<PaymentsController> {
  const ProductSelected({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movie = controller.movie;
    final horary = controller.horary;

    // ignore: close_sinks
    final bloc = BlocProvider.of<PaymentsBloc>(context, listen: false);

    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: Text(
                    "Detalles de la compra",
                    style: TextStyle(
                      fontSize: Adapt.px(35),
                      color: Colors.black.withOpacity(0.6),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          child: Text(
                            movie.titulo,
                            style: TextStyle(
                              fontSize: Adapt.px(25),
                              color: Colors.black.withOpacity(0.6),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          "${horary.fechaCorta} - ${horary.hora}",
                          style: TextStyle(
                            fontSize: Adapt.px(25),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            "${controller.horary.especial == 1 ? controller.eventoVehiculo : controller.movieVehiculo} Vehículos",
                            style: TextStyle(
                              fontSize: Adapt.px(25),
                              color: Colors.black.withOpacity(0.3),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            Helper.moneyFormat(controller.totalXvehiculo),
                            style: TextStyle(
                              fontSize: Adapt.px(25),
                              color: Colors.green.withOpacity(0.6),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            "${controller.horary.especial == 1 ? controller.eventoPersona : controller.moviePersona} Personas extras",
                            style: TextStyle(
                              fontSize: Adapt.px(25),
                              color: Colors.black.withOpacity(0.3),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            Helper.moneyFormat(controller.totalXpersona),
                            style: TextStyle(
                              fontSize: Adapt.px(25),
                              color: Colors.green.withOpacity(0.6),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Divider(),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          "Total",
                          style: TextStyle(
                            fontSize: Adapt.px(25),
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        child: Obx(
                          () => Text(
                            Helper.moneyFormat(controller.totalC),
                            style: TextStyle(
                              fontSize: Adapt.px(25),
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
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
        ),
        Container(
          margin: EdgeInsets.symmetric(
            vertical: 10,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(
                        Adapt.px(80) / 2,
                      ),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: movie.image,
                      imageBuilder: (context, image) => Container(
                        height: Adapt.px(300),
                        width: Adapt.px(200),
                        decoration: BoxDecoration(
                          color: const Color(0xFFAABBCC),
                          image: DecorationImage(
                            image: image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => Container(
                        width: Adapt.px(200),
                        height: Adapt.px(330),
                        color: const Color(0xFFAABBCC),
                      ),
                      errorWidget: (context, url, error) => Container(
                        width: Adapt.px(200),
                        height: Adapt.px(330),
                        color: const Color(0xFFAABBCC),
                      ),
                      fadeOutDuration: const Duration(milliseconds: 400),
                      fadeInDuration: const Duration(milliseconds: 800),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: Adapt.px(20),
                        vertical: Adapt.px(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movie.titulo,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.8),
                              fontSize: Adapt.px(30),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          movie.evento == 1
                              ? SizedBox.shrink()
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: Adapt.px(5),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        text: "Categoría: ",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: Adapt.px(28),
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: movie.categoria,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: Adapt.px(25),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                          SizedBox(
                            height: Adapt.px(10),
                          ),
                          RichText(
                            text: TextSpan(
                              text: "Fecha: ",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: Adapt.px(28),
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: horary.fechaLarga,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: Adapt.px(25),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: Adapt.px(10),
                          ),
                          RichText(
                            text: TextSpan(
                              text: "Horario: ",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: Adapt.px(28),
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: horary.hora,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: Adapt.px(25),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          movie.evento == 1
                              ? SizedBox.shrink()
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: Adapt.px(10),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        text: "Idioma: ",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: Adapt.px(28),
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: horary.funcionIdioma,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: Adapt.px(25),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: Adapt.px(10),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        text: "Subtitulos: ",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: Adapt.px(28),
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: horary.subtitulo,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: Adapt.px(25),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                          SizedBox(
                            height: Adapt.px(20),
                          ),
                          movie.evento == 1
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Zonas",
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(0.8),
                                        fontSize: Adapt.px(25),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black12),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: StreamBuilder(
                                              stream: bloc.zones,
                                              builder: (_, data) {
                                                return DropdownButton(
                                                  value: bloc.zones.value,
                                                  style: TextStyle(
                                                    color: Colors.black.withOpacity(0.4),
                                                    fontSize: Adapt.px(25),
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  icon: SizedBox.shrink(),
                                                  isDense: true,
                                                  underline: SizedBox.shrink(),
                                                  items: bloc.listZones
                                                      .map((e) => DropdownMenuItem(
                                                            child: Text(e),
                                                            value: e,
                                                          ))
                                                      .toList(),
                                                  onChanged: (String value) {
                                                    bloc.zones.updateValue(value);
                                                    print(value);
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_downward,
                                            color: Colors.black.withOpacity(0.4),
                                            size: Adapt.px(30),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : SizedBox.shrink()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              movie.evento == 1 ? const EventoVehiculoPersona() : const MovieVehiculoPersona(),
            ],
          ),
        ),
      ],
    );
  }
}

class MovieVehiculoPersona extends GetView<PaymentsController> {
  const MovieVehiculoPersona({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: NumericStepButton(
                title: Text(
                  "Número de vehículos",
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: Adapt.px(23),
                  ),
                ),
                minValue: 1,
                maxValue: 10,
                total: controller.movieVehiculo,
                onChanged: controller.movieIncrementVehiculo,
              ),
            ),
            Expanded(
              child: Obx(
                () => NumericStepButton(
                  key: Key(controller.movieMaxPersonXvehiculo.toString()),
                  title: Text(
                    "Número de personas extras",
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: Adapt.px(23),
                    ),
                  ),
                  minValue: 0,
                  maxValue: controller.movieMaxPersonXvehiculo,
                  total: controller.moviePersona,
                  onChanged: controller.movieIncrementPerson,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EventoVehiculoPersona extends GetView<PaymentsController> {
  const EventoVehiculoPersona({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: NumericStepButton(
                title: Text(
                  "Número de vehículos",
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: Adapt.px(23),
                  ),
                ),
                minValue: 1,
                maxValue: 10,
                total: controller.eventoVehiculo,
                onChanged: controller.eventoIncrementVehiculo,
              ),
            ),
            Expanded(
              child: Obx(
                () => NumericStepButton(
                  key: Key(controller.eventoMaxPersonXvehiculo.toString()),
                  title: Text(
                    "Número de personas extras",
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: Adapt.px(23),
                    ),
                  ),
                  minValue: 0,
                  maxValue: controller.eventoMaxPersonXvehiculo,
                  total: controller.eventoPersona,
                  onChanged: controller.eventoIncrementPerson,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
