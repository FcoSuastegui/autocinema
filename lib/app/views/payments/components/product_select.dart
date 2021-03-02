import 'package:autocinema/app/themes/adapt.dart';
import 'package:autocinema/app/utils/helper.dart';
import 'package:autocinema/app/views/payments/controller/payments_controller.dart';
import 'package:autocinema/app/widgets/TextField/numeric_step_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductSelected extends GetView<PaymentsController> {
  const ProductSelected({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movie = controller.movie;
    final horary = controller.horary;

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
                            "${controller.vehiculo} Vehículos",
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
                            "${controller.persona} Personas extras",
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
                    ),
                  ),
                ],
              ),
              Container(
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
                          total: controller.vehiculo,
                          onChanged: controller.incrementVehiculo,
                        ),
                      ),
                      Expanded(
                        child: Obx(
                          () => NumericStepButton(
                            key: Key(controller.maxPersonXvehiculo.toString()),
                            title: Text(
                              "Número de personas extras",
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                fontSize: Adapt.px(23),
                              ),
                            ),
                            minValue: 0,
                            maxValue: controller.maxPersonXvehiculo,
                            total: controller.persona,
                            onChanged: controller.incrementPerson,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
