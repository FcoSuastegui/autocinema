import 'package:autocinema/helpers/validator_string_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class CardDetailBloc extends FormBloc<String, String> {
  final name = TextFieldBloc(
    validators: [ValidatorStringBloc.required],
  );

  final number = TextFieldBloc(
    validators: [ValidatorStringBloc.required],
  );

  final date = TextFieldBloc(
    validators: [ValidatorStringBloc.required],
  );

  final cvv = TextFieldBloc(
    validators: [ValidatorStringBloc.required],
  );

  final type = TextFieldBloc(
    validators: [ValidatorStringBloc.required],
  );

  CardDetailBloc() {
    addFieldBlocs(
      fieldBlocs: [name, number, date, cvv, type],
    );
  }

  @override
  void onSubmitting() {}

  @override
  Future<void> close() {
    name.close();
    number.close();
    date.close();
    cvv.close();
    type.close();
    return super.close();
  }
}
