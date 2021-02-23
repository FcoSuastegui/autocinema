import 'package:autocinema/app/utils/formatters.dart';
import 'package:autocinema/app/themes/adapt.dart';
import 'package:autocinema/app/views/card-add/bloc/card_add_bloc.dart';
import 'package:autocinema/app/views/card/controller/card_controller.dart';
import 'package:autocinema/app/widgets/AppBar/my_appbar.dart';
import 'package:autocinema/app/widgets/Cards/components/flip_card.dart';
import 'package:autocinema/app/widgets/Cards/my_card.dart';
import 'package:autocinema/app/widgets/Fields/input_text_card_bloc.dart';
import 'package:autocinema/app/widgets/Fields/input_text_cupertino.dart';
import 'package:autocinema/app/widgets/Loading/loading_apleeks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';

class CardAddView extends GetView<CardController> {
  const CardAddView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FlipCardState> animatedStateKey = GlobalKey<FlipCardState>();

    return Scaffold(
      appBar: MyAppBar(
        appBarTitle: "Nueva tarjeta",
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: BlocProvider(
          create: (context) => CardAddBloc(),
          child: Builder(
            builder: (context) {
              final add = BlocProvider.of<CardAddBloc>(context);
              return FormBlocListener<CardAddBloc, String, String>(
                onSubmitting: (context, state) => LoadingApleeks.show(context),
                onSuccess: (context, state) {
                  LoadingApleeks.hide(context);
                  add.close();
                },
                onFailure: (context, state) {
                  LoadingApleeks.hide(context);
                },
                child: ListView(
                  itemExtent: 750.0,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: Adapt.px(10),
                            ),
                            child: StreamBuilder(
                                stream: add,
                                builder: (_, __) {
                                  final exp = add.expired.value.split('/');
                                  String month = '';
                                  String year = '';
                                  if (exp.length == 2) {
                                    month = exp[0];
                                    year = exp[1];
                                  }

                                  return MyCard(
                                    animatedStateKey: animatedStateKey,
                                    cardColorIndexSelected: 1,
                                    cardHolderName: add.name.value,
                                    cardNumber: add.number.value,
                                    cardMonth: month,
                                    cardYear: year,
                                    cardCvv: add.cvv.value,
                                    cardType: add.type.value,
                                  );
                                }),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: Adapt.px(10),
                            ),
                            child: Column(
                              children: [
                                InputTextCupertino(
                                  input: add.name,
                                  placeholder: "Cardholder Name",
                                  onChanged: (e) => add.name.updateValue(e),
                                ),
                                InputTextCardBloc(
                                  textFieldBloc: add.name,
                                  hintText: 'Cardholder Name',
                                  textCapitalization: TextCapitalization.characters,
                                ),
                                InputTextCardBloc(
                                  textFieldBloc: add.number,
                                  keyboardType: TextInputType.number,
                                  hintText: 'Card Number',
                                  inputFormatters: [
                                    MaskedTextInputFormatter(
                                      mask: 'xxxx xxxx xxxx xxxx',
                                      separator: ' ',
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: InputTextCardBloc(
                                        textFieldBloc: add.expired,
                                        hintText: 'Valid Thru',
                                        inputFormatters: [
                                          MaskedTextInputFormatter(
                                            mask: 'xx/xx',
                                            separator: '/',
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: Adapt.px(20)),
                                    Expanded(
                                      flex: 2,
                                      child: InputTextCardBloc(
                                        textFieldBloc: add.cvv,
                                        hintText: 'Cardholder Name',
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
