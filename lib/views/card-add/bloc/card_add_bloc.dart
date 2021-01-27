import 'package:autocinema/helpers/validator_string_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class CardAddBloc extends FormBloc<String, String> {
  final name = TextFieldBloc(
    validators: [ValidatorStringBloc.required],
  );

  final number = TextFieldBloc(
    validators: [
      ValidatorStringBloc.required,
      ValidatorStringBloc.validateCardNumber,
    ],
  );

  final expired = TextFieldBloc(
    validators: [
      ValidatorStringBloc.required,
      ValidatorStringBloc.validateCardValidThru,
    ],
  );

  final cvv = TextFieldBloc(
    validators: [
      ValidatorStringBloc.required,
      ValidatorStringBloc.validateCardCvv,
    ],
  );

  final type = TextFieldBloc(
    validators: [ValidatorStringBloc.required],
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
