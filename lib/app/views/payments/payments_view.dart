import 'package:autocinema/app/data/models/horary_model.dart';
import 'package:autocinema/app/data/models/movie_model.dart';
import 'package:autocinema/app/themes/adapt.dart';
import 'package:autocinema/app/utils/helper.dart';
import 'package:autocinema/app/views/payments/bloc/payments_bloc.dart';
import 'package:autocinema/app/views/payments/components/credit_card_view.dart';
import 'package:autocinema/app/views/payments/components/personal_data_view.dart';
import 'package:autocinema/app/views/payments/components/product_select.dart';
import 'package:autocinema/app/views/payments/components/stepper_view.dart';
import 'package:autocinema/app/views/payments/controller/payments_controller.dart';
import 'package:autocinema/app/widgets/Loading/loading_apleeks.dart';
import 'package:autocinema/app/widgets/UnFocus/un_focus_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';

class PaymentsView extends StatelessWidget {
  final MovieModel movie;
  final HoraryModel horary;

  const PaymentsView({
    Key key,
    @required this.movie,
    @required this.horary,
  })  : assert(movie != null),
        assert(horary != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController _pageViewController = PageController(initialPage: 0);
    return GetBuilder<PaymentsController>(
      init: PaymentsController(
        movie: movie,
        horary: horary,
      ),
      builder: (c) => UnFocusForm(
        child: Scaffold(
          resizeToAvoidBottomPadding: true,
          appBar: AppBar(
            brightness: Brightness.light,
            leading: IconButton(
              color: Colors.black.withOpacity(0.3),
              icon: Icon(Icons.clear),
              onPressed: () => Navigator.pop(context),
            ),
            title: Text(
              "Processo de pago",
              style: TextStyle(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
            elevation: 0.0,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 5,
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
                                  "${c.vehiculo} Vehículos",
                                  style: TextStyle(
                                    fontSize: Adapt.px(25),
                                    color: Colors.black.withOpacity(0.3),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  Helper.moneyFormat(c.totalXvehiculo),
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
                                  "${c.persona} Personas extras",
                                  style: TextStyle(
                                    fontSize: Adapt.px(25),
                                    color: Colors.black.withOpacity(0.3),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  Helper.moneyFormat(c.totalXpersona),
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
                                  Helper.moneyFormat(c.totalC),
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
              Expanded(
                flex: 8,
                child: BlocProvider(
                  create: (context) => PaymentsBloc(
                    total: c.totalC,
                    pageViewController: _pageViewController,
                  ),
                  child: Builder(
                    builder: (context) {
                      final bloc = BlocProvider.of<PaymentsBloc>(context);
                      return FormBlocListener<PaymentsBloc, String, String>(
                        onSubmitting: (context, state) => LoadingApleeks.show(context),
                        onSuccess: (context, state) {
                          LoadingApleeks.hide(context);
                          if (state.stepCompleted == state.lastStep) {
                            Get.back();
                            bloc.close();
                          }
                        },
                        onFailure: (context, state) async {
                          LoadingApleeks.hide(context);
                          Helper.error(message: state.failureResponse);
                        },
                        child: StepperView(
                          listSteps: [
                            StepItem(
                              title: "Producto seleccionado",
                              icon: Icons.shopping_cart,
                            ),
                            StepItem(
                              title: "Información personal",
                              icon: Icons.person_add,
                            ),
                            StepItem(
                              title: "Tarjeta",
                              icon: Icons.credit_card,
                            ),
                            StepItem(
                              title: "Éxito",
                              icon: Icons.check,
                            ),
                          ],
                          stepContents: [
                            const ProductSelected(),
                            const PersonalDataView(),
                            const CreditCardView(),
                            Container(),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
