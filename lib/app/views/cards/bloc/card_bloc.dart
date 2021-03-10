import 'package:autocinema/app/data/services/autocinema_service.dart';
import 'package:autocinema/app/utils/validator_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class CardBloc extends FormBloc<String, String> {
  final PageController pageController;

  final none = TextFieldBloc();

  final name = TextFieldBloc(
    validators: [
      ValidatorString.required,
      ValidatorString.validateText,
    ],
  );
  final firstSurname = TextFieldBloc(
    validators: [
      ValidatorString.required,
      ValidatorString.validateText,
    ],
  );
  final secondSurname = TextFieldBloc();
  final email = TextFieldBloc(
    validators: [
      ValidatorString.required,
      ValidatorString.emailFormat,
    ],
  );
  final address = TextFieldBloc(
    validators: [
      ValidatorString.required,
    ],
  );
  final phone = TextFieldBloc(
    validators: [
      ValidatorString.required,
      ValidatorString.validateCelPhoneFormate,
    ],
  );
  final city = TextFieldBloc(
    validators: [
      ValidatorString.required,
      ValidatorString.validateText,
    ],
  );
  final codigoPostal = TextFieldBloc(
    validators: [
      ValidatorString.validateOnlyNumber,
      ValidatorString.validateCodigoPostal,
      ValidatorString.required,
    ],
  );
  final states = SelectFieldBloc<String, Object>(
    items: [],
  );

  final titular = TextFieldBloc(
    validators: [
      ValidatorString.required,
      ValidatorString.validateText,
    ],
  );

  final cardNumber = TextFieldBloc(
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

  CardBloc({this.pageController}) {
    getStates();
    addFieldBlocs(
      step: 0,
      fieldBlocs: [
        name,
        firstSurname,
        secondSurname,
        email,
        address,
        phone,
        city,
        codigoPostal,
        states
      ],
    );
    addFieldBlocs(
      step: 1,
      fieldBlocs: [titular, cardNumber, expired, cvv],
    );
    addFieldBlocs(
      step: 2,
      fieldBlocs: [titular, cardNumber, expired, cvv],
    );
  }

  void back() {
    updateCurrentStep(
      state.currentStep != 0 ? state.currentStep - 1 : 0,
    );
    pageController.previousPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void next() {
    emitSuccess();
    pageController.nextPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  @override
  void onSubmitting() async {
    print(state);
    if (state.numberOfSteps != state.currentStep) {
      await Future.delayed(const Duration(seconds: 1));
      next();
    }
  }

  Future<void> getStates() async {
    final lStates = await AutoCinemaService.states();
    final List<String> list = [];
    lStates.forEach((element) {
      list.add(element.label);
    });
    states.updateItems(list);
  }

  @override
  Future<void> close() {
    name.close();
    firstSurname.close();
    secondSurname.close();
    email.close();
    phone.close();
    address.close();
    city.close();
    codigoPostal.close();
    states.close();
    titular.close();
    cardNumber.close();
    expired.close();
    cvv.close();
    none.close();
    return super.close();
  }
}
