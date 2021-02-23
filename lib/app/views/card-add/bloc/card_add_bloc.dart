import 'package:autocinema/app/utils/validator_string.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class CardAddBloc extends FormBloc<String, String> {
  final name = TextFieldBloc(
    validators: [ValidatorString.required],
  );

  final number = TextFieldBloc(
    validators: [
      ValidatorString.required,
      ValidatorString.validateCardNumber,
    ],
  );

  final expired = TextFieldBloc(
    validators: [
      ValidatorString.required,
      ValidatorString.validateCardValidThru,
    ],
  );

  final cvv = TextFieldBloc(
    validators: [
      ValidatorString.required,
      ValidatorString.validateCardCvv,
    ],
  );

  final type = TextFieldBloc(
    validators: [ValidatorString.required],
  );

  CardAddBloc() {
    addFieldBlocs(
      fieldBlocs: [name, number, expired, cvv, type],
    );
  }

  @override
  void onSubmitting() {}

  @override
  Future<void> close() {
    name.close();
    number.close();
    expired.close();
    cvv.close();
    type.close();
    return super.close();
  }
}
