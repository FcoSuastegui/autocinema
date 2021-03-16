import 'package:autocinema/app/themes/adapt.dart';
import 'package:autocinema/app/themes/app_theme.dart';
import 'package:autocinema/app/utils/formatters.dart';
import 'package:autocinema/app/utils/storage.dart';
import 'package:autocinema/app/views/payments/bloc/payments_bloc.dart';
import 'package:autocinema/app/widgets/PdfViewer/pdf_viewer.dart';
import 'package:autocinema/app/widgets/TextField/input_text_cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';

class CreditCardView extends StatelessWidget {
  const CreditCardView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final bloc = BlocProvider.of<PaymentsBloc>(context, listen: false);

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
          CheckboxFieldBlocBuilder(
            booleanFieldBloc: bloc.terminos,
            controlAffinity: FieldBlocBuilderControlAffinity.leading,
            padding: EdgeInsets.zero,
            body: Container(
              alignment: Alignment.center,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      "Acepto términos y condiciones.",
                      style: TextStyle(
                        fontSize: Adapt.px(30),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.to(
                      () => PdfViewer(
                        path: Storage.config.terminos,
                        title: "Términos y condiciones",
                      ),
                      fullscreenDialog: true,
                    ),
                    child: Text(
                      "Ver Términos",
                      style: TextStyle(
                        color: AppTheme.kPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: Adapt.px(30),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
