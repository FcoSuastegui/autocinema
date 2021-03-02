import 'package:autocinema/app/data/models/state_model.dart';
import 'package:autocinema/app/data/services/autocinema_service.dart';
import 'package:autocinema/app/utils/validator_string.dart';
import 'package:autocinema/app/views/payments/controller/payments_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';

class PaymentsBloc extends FormBloc<String, String> {
  double total = 00;
  final PaymentsController controller;

  final PaymentsController c = Get.find<PaymentsController>();
  final PageController pageViewController;

  List<StateModel> listStates = [];

  final none = TextFieldBloc();

  final name = TextFieldBloc(
    validators: [
      ValidatorString.required,
      ValidatorString.validateText,
    ],
  );
  final firstName = TextFieldBloc(
    validators: [
      ValidatorString.required,
      ValidatorString.validateText,
    ],
  );
  final secondName = TextFieldBloc();
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
    validators: [ValidatorString.validateOnlyNumber, ValidatorString.required],
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

  PaymentsBloc({
    @required this.controller,
    @required this.pageViewController,
  }) : assert(controller != null) {
    getStates();
    addFieldBlocs(
      step: 0,
      fieldBlocs: [none],
    );
    addFieldBlocs(
      step: 1,
      fieldBlocs: [name, firstName, secondName, email, address, phone, city, codigoPostal, states],
    );
    addFieldBlocs(
      step: 2,
      fieldBlocs: [titular, cardNumber, expired, cvv],
    );
    addFieldBlocs(
      step: 3,
      fieldBlocs: [none],
    );
  }

  @override
  void onSubmitting() async {
    total = c.totalC;
    print(c.totalC);

    if (state.currentStep == 0) {
      await Future.delayed(const Duration(seconds: 1));
      next();
    } else if (state.currentStep == 1) {
      await Future.delayed(const Duration(seconds: 1));
      next();
    } else if (state.currentStep == 2) {
      await Future.delayed(const Duration(seconds: 1));
      next();
    } else {
      await Future.delayed(const Duration(seconds: 1));
      emitSuccess();
    }
  }

  void back() {
    updateCurrentStep(
      state.currentStep != 0 ? state.currentStep - 1 : 0,
    );
    pageViewController.previousPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void next() {
    emitSuccess();
    pageViewController.nextPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  Future<void> getStates() async {
    final lStates = await AutoCinemaService.states();
    listStates = lStates;
    final List<String> list = [];
    lStates.forEach((element) {
      list.add(element.label);
    });
    states.updateItems(list);
  }

  @override
  Future<void> close() {
    none.close();
    name.close();
    firstName.close();
    secondName.close();
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
    return super.close();
  }
}
