import 'package:autocinema/controllers/native/sr_pago_channel.dart';
import 'package:autocinema/helpers/validator_string_bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class PagoBloc extends FormBloc<String, String> {
  final name = TextFieldBloc(validators: [
    ValidatorStringBloc.required,
  ]);
  final tarjet = TextFieldBloc(validators: [
    ValidatorStringBloc.required,
    ValidatorStringBloc.validateCardNumber,
  ]);
  final cvv = TextFieldBloc(validators: [
    ValidatorStringBloc.required,
    ValidatorStringBloc.validateCardCvv,
  ]);
  final expired = TextFieldBloc(validators: [
    ValidatorStringBloc.required,
    ValidatorStringBloc.validateCardValidThru,
  ]);

  PagoBloc() {
    addFieldBlocs(fieldBlocs: [name, tarjet, cvv, expired]);
  }

  @override
  void onSubmitting() async {
    final expire = expired.value.split('/');

    final sr = SrPagoChannel.i;
    sr.publicKey = "pk_dev_5c056344c05fdc*?37";

    try {
      final r = await sr.getTokenSrPago(SrPagoCreditCard(
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
