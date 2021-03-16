import 'package:autocinema/app/data/models/horary_model.dart';
import 'package:autocinema/app/data/models/movie_model.dart';
import 'package:autocinema/app/utils/helper.dart';
import 'package:autocinema/app/views/payments/bloc/payments_bloc.dart';
import 'package:autocinema/app/views/payments/components/credit_card_view.dart';
import 'package:autocinema/app/views/payments/components/personal_data_view.dart';
import 'package:autocinema/app/views/payments/components/product_select.dart';
import 'package:autocinema/app/views/payments/components/stepper_view.dart';
import 'package:autocinema/app/views/payments/components/success_payment.dart';
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
      builder: (c) => BlocProvider(
        create: (context) => PaymentsBloc(
          controller: c,
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
              child: WillPopScope(
                onWillPop: () async {
                  _closeProcess(context);
                  return Future.value(false);
                },
                child: UnFocusForm(
                  child: Scaffold(
                    resizeToAvoidBottomPadding: true,
                    appBar: AppBar(
                      brightness: Brightness.light,
                      title: Text(
                        "Processo de pago",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.3),
                        ),
                      ),
                      elevation: 0.0,
                    ),
                    body: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.9,
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
                                const SuccessPayments(),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _closeProcess(BuildContext context) async {
    final finish = BlocProvider.of<PaymentsBloc>(context, listen: false).finish;
    if (!finish) {
      final result = await Get.dialog(
        AlertDialog(
          content: Text("¿Deseas cancelar el proceso de pago?"),
          actions: [
            OutlineButton(
              child: Text("Cerrar"),
              onPressed: () => Get.back(result: false),
            ),
            OutlineButton(
              child: Text(
                "Cancelar pago",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              onPressed: () => Get.back(result: true),
            )
          ],
        ),
        barrierDismissible: false,
        barrierColor: Colors.transparent.withOpacity(0.8),
      );
      if (result != null && result) {
        Get.back();
      }
    } else {
      Get.back();
    }
  }
}
