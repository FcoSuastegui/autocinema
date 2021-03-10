import 'package:autocinema/app/themes/adapt.dart';
import 'package:autocinema/app/utils/formatters.dart';
import 'package:autocinema/app/views/cards/bloc/card_bloc.dart';
import 'package:autocinema/app/widgets/TextField/input_text_cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class StepperCard extends StatelessWidget {
  const StepperCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final bloc = BlocProvider.of<CardBloc>(context);
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InputTextCupertino(
            textFieldBloc: bloc.titular,
            placeholder: 'Titular',
            keyboardType: TextInputType.text,
          ),
          InputTextCupertino(
            textFieldBloc: bloc.cardNumber,
            placeholder: 'Número de tarjeta',
            keyboardType: TextInputType.phone,
            maxLength: 19,
            maxLengthEnforced: true,
            inputFormatters: [
              MaskedTextInputFormatter(
                mask: 'xxxx xxxx xxxx xxxx',
                separator: ' ',
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: InputTextCupertino(
                  textFieldBloc: bloc.expired,
                  placeholder: 'MM/YY',
                  keyboardType: TextInputType.phone,
                  maxLength: 5,
                  maxLengthEnforced: true,
                  inputFormatters: [
                    MaskedTextInputFormatter(
                      mask: 'xx/xx',
                      separator: '/',
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: InputTextCupertino(
                  textFieldBloc: bloc.cvv,
                  placeholder: 'CVV',
                  keyboardType: TextInputType.phone,
                  maxLength: 3,
                  maxLengthEnforced: true,
                  suffixButton: SuffixButton.obscureText,
                  textInputAction: TextInputAction.done,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Image.asset(
            "assets/images/card_scanner.png",
            height: Adapt.px(100),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Escanear tarjeta",
          ),
        ],
      ),
    );
  }
}
