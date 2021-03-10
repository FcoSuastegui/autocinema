import 'package:autocinema/app/utils/helper.dart';
import 'package:autocinema/app/views/cards/bloc/card_bloc.dart';
import 'package:autocinema/app/views/cards/components/stepper_card.dart';
import 'package:autocinema/app/views/cards/components/stepper_personal.dart';
import 'package:autocinema/app/views/cards/components/stepper_success.dart';
import 'package:autocinema/app/views/cards/components/stepper_view.dart';
import 'package:autocinema/app/widgets/Loading/loading_apleeks.dart';
import 'package:autocinema/app/widgets/UnFocus/un_focus_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';

class CardAddView extends StatelessWidget {
  static final String routeName = '/card-add';
  const CardAddView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController _pageViewController = PageController(initialPage: 0);
    return UnFocusForm(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Agregar tarjeta"),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: BlocProvider(
            create: (context) => CardBloc(
              pageController: _pageViewController,
            ),
            child: Builder(
              builder: (context) {
                final bloc = BlocProvider.of<CardBloc>(context);
                return FormBlocListener<CardBloc, String, String>(
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
                      const StepperPersonal(),
                      const StepperCard(),
                      const StepperSuccess(),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
