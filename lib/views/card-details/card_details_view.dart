import 'package:autocinema/helpers/formatters.dart';
import 'package:autocinema/themes/size_config.dart';
import 'package:autocinema/views/card-details/bloc/card_detail_bloc.dart';
import 'package:autocinema/views/card/controller/card_controller.dart';
import 'package:autocinema/widgets/AppBar/my_appbar.dart';
import 'package:autocinema/widgets/Cards/components/flip_card.dart';
import 'package:autocinema/widgets/Cards/my_card.dart';
import 'package:autocinema/widgets/Cards/utils/card_colors.dart';
import 'package:autocinema/widgets/Fields/input_text_card_bloc.dart';
import 'package:autocinema/widgets/Loading/loading_apleeks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';

class CardDetailsView extends GetView<CardController> {
  const CardDetailsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FlipCardState> animatedStateKey = GlobalKey<FlipCardState>();

    controller.getArguments();
    final card = controller.card;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: BlocProvider(
        create: (context) => CardDetailBloc(),
        child: Builder(
          builder: (context) {
            final detail = BlocProvider.of<CardDetailBloc>(context);
            detail.name.updateValue(card.cardHolderName);
            detail.number.updateValue(card.cardNumber);
            detail.date.updateValue(card.cardMonth);
            detail.cvv.updateValue(card.cardCvv);
            detail.type.updateValue(card.cardType);

            return FormBlocListener<CardDetailBloc, String, String>(
              onSubmitting: (context, state) => LoadingApleeks.show(context),
              onSuccess: (context, state) {
                LoadingApleeks.hide(context);
                detail.close();
              },
              onFailure: (context, state) {
                LoadingApleeks.hide(context);
              },
              child: Scaffold(
                appBar: MyAppBar(
                  appBarTitle: card.cardHolderName,
                ),
                body: ListView(
                  itemExtent: 750.0,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(10),
                            ),
                            child: MyCard(
                              animatedStateKey: animatedStateKey,
                              cardColorIndexSelected: CardColor.colorPosition(card.cardColor),
                              cardHolderName: card.cardHolderName,
                              cardNumber: card.cardNumber,
                              cardMonth: card.cardMonth,
                              cardYear: card.cardYear,
                              cardCvv: card.cardCvv,
                              cardType: card.cardType,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(10),
                              vertical: getProportionateScreenWidth(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                InputTextCardBloc(
                                  textFieldBloc: detail.name,
                                  hintText: 'Cardholder Name',
                                  readOnly: true,
                                ),
                                InputTextCardBloc(
                                  textFieldBloc: detail.number,
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
                                        textFieldBloc: detail.date,
                                        hintText: 'Valid Thru',
                                        readOnly: true,
                                        inputFormatters: [
                                          MaskedTextInputFormatter(
                                            mask: 'xx/xx',
                                            separator: '/',
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: getProportionateScreenWidth(20)),
                                    Expanded(
                                      flex: 2,
                                      child: InputTextCardBloc(
                                        textFieldBloc: detail.cvv,
                                        hintText: 'Cardholder Name',
                                        readOnly: true,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: getProportionateScreenWidth(20)),
                                cardColors(context),
                                SizedBox(height: getProportionateScreenWidth(20)),
                                FlatButton(
                                  textColor: Colors.white,
                                  color: Colors.blue.withOpacity(0.7),
                                  onPressed: detail.submit,
                                  child: Text("Aceptar"),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget cardColors(BuildContext context) {
    final dotSize = (MediaQuery.of(context).size.width - 220) / CardColor.baseColors.length;

    List<Widget> dotList = new List<Widget>();

    CardColor.baseColors.forEach((item) {
      dotList.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: GestureDetector(
            onTap: () => {},
            child: Container(
              child: Container(),
              width: dotSize,
              height: dotSize,
              decoration: new BoxDecoration(
                color: CardColor.baseColors[CardColor.colorPosition(item)],
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      );
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: dotList,
    );
  }
}
