import 'package:autocinema/app/data/models/zone_model.dart';
import 'package:autocinema/app/data/services/autocinema_service.dart';
import 'package:autocinema/app/globals/SrPago/permission.dart';
import 'package:autocinema/app/globals/SrPago/sr_pago_card_model.dart';
import 'package:autocinema/app/globals/SrPago/sr_pago_flutter.dart';
import 'package:autocinema/app/utils/storage.dart';
import 'package:autocinema/app/utils/validator_string.dart';
import 'package:autocinema/app/views/payments/controller/payments_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';

class PaymentsBloc extends FormBloc<String, String> {
  double total = 00;
  bool finish = false;

  final PaymentsController controller;
  Map<String, String> folios = {
    'SrPagoFolio': '',
    'folioQr': '',
  };

  final PaymentsController c = Get.find<PaymentsController>();
  final PageController pageViewController;

  List<String> listZones = [];
  List<ZoneModel> listZoneModel = [];

  final none = TextFieldBloc();

  final terminos = BooleanFieldBloc();

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
    validators: [
      ValidatorString.validateOnlyNumber,
      ValidatorString.validateCodigoPostal,
      ValidatorString.required,
    ],
  );
  final states = SelectFieldBloc<String, Object>(
    items: [],
  );

  final zones = SelectFieldBloc<String, Object>(
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
    getZones();
    addFieldBlocs(
      step: 0,
      fieldBlocs: [none, zones],
    );
    addFieldBlocs(
      step: 1,
      fieldBlocs: [name, firstName, secondName, email, address, phone, city, codigoPostal, states],
    );
    addFieldBlocs(
      step: 2,
      fieldBlocs: [titular, cardNumber, expired, cvv, terminos],
    );
    addFieldBlocs(
      step: 3,
      fieldBlocs: [none],
    );
  }

  @override
  void onSubmitting() async {
    total = c.totalC;
    if (state.currentStep == 0) {
      await Future.delayed(const Duration(seconds: 1));
      next();
    } else if (state.currentStep == 1) {
      await Future.delayed(const Duration(seconds: 1));
      next();
    } else if (state.currentStep == 2) {
      if (!terminos.value) {
        return emitFailure(
          failureResponse: "Acepta terminos y condiciones para continuar",
        );
      }
      try {
        final expire = expired.value.split('/');
        final sr = await SrPagoFlutter.createCardToken(
          SrPagoCardModel(
            name: titular.value,
            number: cardNumber.value.replaceAll(" ", ""),
            cvv: cvv.value,
            month: expire[0],
            year: expire[1],
          ),
        );

        if (sr.type != PermissionStatus.granted) {
          return emitFailure(
            failureResponse: sr.message,
          );
        } else {
          print(sr.token);
          if (sr.status) {
            final Map<String, dynamic> datos = {
              "total": c.totalC,
              "token": sr.token,
              "email": email.value,
              "nombre": name.value,
              "primerApellido": firstName.value,
              "segundoApellido": secondName.value,
              "direccion": address.value,
              "ciudad": city.value,
              "estado": states.value,
              "Codigopostal": codigoPostal.value,
              "pais": "MX",
              "telefono": phone.value,
              "funcion": c.horary.id,
              "tarifa": c.horary.tarifa,
              "cantidad": c.horary.especial == 1
                  ? c.eventoVehiculo
                  : c.movieVehiculo + c.horary.especial == 1
                      ? c.eventoPersona
                      : c.moviePersona,
              "id_user_client": Storage.user.id,
              "titular": titular.value,
              "items": [
                {
                  "idHorario": c.horary.id,
                  "idUsuario": 0,
                  "numCarros": c.horary.especial == 1 ? c.eventoVehiculo : c.movieVehiculo,
                  "numExtras": c.horary.especial == 1 ? c.eventoPersona : c.moviePersona,
                  "tarifa": c.horary.tarifa,
                  "tarifaExtras": c.horary.tarifaExtras,
                  "tipoItem": 1,
                  "idTarifa": c.horary.idTarifa,
                  "idTarifaPersonasExtras": c.horary.idTarifaPersonasExtra
                }
              ]
            };

            final backend = await AutoCinemaService.processPagoBackend(datos);

            if (backend.status) {
              folios['SrPagoFolio'] = backend.data['SrPago'];
              folios['folioQr'] = backend.data['folio'];
              finish = true;
              next();
            } else {
              print(backend.message);
              emitFailure(
                failureResponse:
                    "Hubo un error en procesar la información contacte con el encargado de la plataforma.",
              );
            }
          } else {
            emitFailure(
              failureResponse: messageSrPago(sr.message),
            );
          }
        }
      } on PlatformException catch (e) {
        return emitFailure(
          failureResponse: "${e.message}",
        );
      } catch (e) {
        return emitFailure(
          failureResponse: "${e.message}",
        );
      }
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

  String messageSrPago(String v) {
    print("SrPago $v");
    Map<String, dynamic> message = {
      'cardholder_name': "El campo titular debe ser legible",
      'number': "El campo número de tarjeta debe ser correcta",
      'Número de tarjeta inválido': "Número de tarjeta inválido",
    };
    return message[v] ?? v;
  }

  Future<void> getStates() async {
    final lStates = await AutoCinemaService.states();
    final List<String> list = [];
    lStates.forEach((element) {
      list.add(element.label);
    });
    states.updateItems(list);
  }

  Future<void> getZones() async {
    if (c.horary.especial == 1) {
      final lZones = await AutoCinemaService.zones(
        idevento: c.horary.id,
      );
      final List<String> list = [];
      lZones.forEach((element) {
        listZones.add(element.label);
        list.add(element.label);
      });
      print(list.toList());
      zones.updateInitialValue(list.first);
    }
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
    terminos.close();
    zones.close();
    return super.close();
  }
}
