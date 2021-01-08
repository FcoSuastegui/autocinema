import 'package:autocinema/helpers/formatters.dart';
import 'package:autocinema/views/account/bloc_pago.dart';
import 'package:autocinema/widgets/Carousel/carousel_indicator/carousel_indicator.dart';
import 'package:autocinema/widgets/Carousel/carousel_indicator/controller/carousel_controller.dart';
import 'package:autocinema/widgets/Fields/input_text_field_bloc.dart';
import 'package:autocinema/widgets/Loading/loading_apleeks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

final List<String> imgList = [
  'https://cinema.timeshareapp.com/storage/images/banners/banner01.jpg?0.0024339407705086663',
  'https://cinema.timeshareapp.com/storage/images/banners/banner02.jpg?0.9654531581005577',
  'https://cinema.timeshareapp.com/storage/images/banners/banner03.jpg?0.8199639989249073',
];

class AccountView extends StatefulWidget {
  const AccountView({Key key}) : super(key: key);

  @override
  _AccountViewState createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  String response = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: CarouselWithIndicator(
                controller: CarouselIndicatorController(),
                listImage: imgList,
                fit: BoxFit.fill,
              ),
            ),
            BlocProvider(
              create: (context) => PagoBloc(),
              child: Builder(
                builder: (context) {
                  final pago = BlocProvider.of<PagoBloc>(context);
                  return FormBlocListener<PagoBloc, String, String>(
                    onSubmitting: (context, state) => LoadingApleeks.show(context),
                    onSuccess: (context, state) {
                      LoadingApleeks.hide(context);
                      setState(() {
                        response = state.successResponse;
                      });
                    },
                    onFailure: (context, state) {
                      LoadingApleeks.hide(context);
                      setState(() {
                        response = state.failureResponse;
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        InputTextFieldBloc(
                          textFieldBloc: pago.name,
                          labelText: "Nombre del titular",
                        ),
                        InputTextFieldBloc(
                          textFieldBloc: pago.tarjet,
                          labelText: "Número de tarjeta",
                          hintText: 'xxxx xxxx xxxx xxxx',
                          keyboardType: TextInputType.phone,
                          maxLength: 19,
                          counterText: '',
                          maxLengthEnforced: true,
                          inputFormatters: [
                            MaskedTextInputFormatter(
                              mask: 'xxxx xxxx xxxx xxxx',
                              separator: ' ',
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            bottom: 20.0,
                            top: 5.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                flex: 2,
                                child: Container(
                                  margin: EdgeInsets.only(right: 10.0),
                                  child: InputTextFieldBloc(
                                    textFieldBloc: pago.expired,
                                    maxLength: 5,
                                    maxLengthEnforced: true,
                                    labelText: "Fecha expiración",
                                    hintText: "10/20",
                                    inputFormatters: [
                                      MaskedTextInputFormatter(
                                        mask: 'xx/xx',
                                        separator: '/',
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InputTextFieldBloc(
                                  textFieldBloc: pago.cvv,
                                  keyboardType: TextInputType.phone,
                                  maxLength: 3,
                                  maxLengthEnforced: true,
                                  labelText: "CVV",
                                ),
                              )
                            ],
                          ),
                        ),
                        FlatButton(
                          textColor: Colors.white,
                          color: Colors.blue.withOpacity(0.7),
                          onPressed: pago.submit,
                          child: Text("Sr Pago"),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Text(response),
          ],
        ),
      ),
    );
  }
}
