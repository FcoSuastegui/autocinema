import 'package:autocinema/app/utils/validator_string.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class CardDetailBloc extends FormBloc<String, String> {
  final name = TextFieldBloc(
    validators: [ValidatorString.required],
  );

  final number = TextFieldBloc(
    validators: [ValidatorString.required],
  );

  final date = TextFieldBloc(
    validators: [ValidatorString.required],
  );

  final cvv = TextFieldBloc(
    validators: [ValidatorString.required],
  );

  final type = TextFieldBloc(
    validators: [ValidatorString.required],
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
