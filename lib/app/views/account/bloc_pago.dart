import 'dart:io';

import 'package:autocinema/app/global/SrPago/sr_pago_card_model.dart';
import 'package:autocinema/app/global/SrPago/sr_pago_flutter.dart';
import 'package:autocinema/app/utils/validator_string.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class PagoBloc extends FormBloc<String, String> {
  final name = TextFieldBloc(validators: [
    ValidatorString.required,
  ]);
  final tarjet = TextFieldBloc(validators: [
    ValidatorString.required,
    ValidatorString.validateCardNumber,
  ]);
  final cvv = TextFieldBloc(validators: [
    ValidatorString.required,
    ValidatorString.validateCardCvv,
  ]);
  final expired = TextFieldBloc(validators: [
    ValidatorString.required,
    ValidatorString.validateCardValidThru,
  ]);

  PagoBloc() {
    addFieldBlocs(fieldBlocs: [name, tarjet, cvv, expired]);
  }

  @override
  void onSubmitting() async {
    final expire = expired.value.split('/');

    SrPagoFlutter.publicKey =
        Platform.isAndroid ? "pk_dev_600b22e10a2013gXUe" : "pk_dev_600b23519d87fMbtz9";

    //SrPagoFlutter.publicKey = "pk_dev_5c056344c05fdc*?37";

    try {
      final r = await SrPagoFlutter.createCardToken(SrPagoCardModel(
        name: name.value,
        number: tarjet.value.replaceAll(" ", ""),
        cvv: cvv.value,
        month: expire[0],
        year: expire[1],
      ));

      if (r.status) {
        return emitSuccess(
          canSubmitAgain: true,
          successResponse: "${r.message}",
        );
      }

      return emitSuccess(
        canSubmitAgain: true,
        successResponse: "${r.message}",
      );
    } on PlatformException catch (e) {
      return emitFailure(
        failureResponse: "${e.message}",
      );
    } catch (e) {
      return emitFailure(
        failureResponse: "${e.message}",
      );
    }
  }

  @override
  Future<void> close() {
    name?.close();
    tarjet?.close();
    cvv?.close();
    expired?.close();
    return super.close();
  }
}
