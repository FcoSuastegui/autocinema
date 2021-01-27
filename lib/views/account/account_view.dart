import 'package:autocinema/helpers/formatters.dart';
import 'package:autocinema/views/account/bloc_pago.dart';
import 'package:autocinema/widgets/Carousel/carousel_indicator/carousel_indicator.dart';
import 'package:autocinema/widgets/Carousel/carousel_indicator/controller/carousel_controller.dart';
/* import 'package:autocinema/widgets/CreditCard/slider/card_background.dart';
import 'package:autocinema/widgets/CreditCard/slider/card_company.dart';
import 'package:autocinema/widgets/CreditCard/slider/card_network_type.dart';
import 'package:autocinema/widgets/CreditCard/slider/credit_card_slider.dart';
import 'package:autocinema/widgets/CreditCard/slider/credit_card_widget.dart';
import 'package:autocinema/widgets/CreditCard/slider/validity.dart'; */
import 'package:autocinema/widgets/Fields/input_text_field_bloc.dart';
import 'package:autocinema/widgets/Loading/loading_apleeks.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter/material.dart';

/* import 'package:autocinema/views/account/components/setting_body.dart';
import 'package:autocinema/views/account/components/setting_header.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SettingHeader(),
                SettingBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
} */

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
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
                                      keyboardType: TextInputType.phone,
                                      labelText: "Fecha expiración",
                                      hintText: "10/20",
                                      counterText: "2/2",
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
      ),
    );
  }
}

/* 
class AccountView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              color: kBlue,
              child: Text('Simple card slider', style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SimpleCreditCardSlider(),
                  ),
                );
              },
            ),
            RaisedButton(
              color: kBlue,
              child: Text('Credit card slider with repeating down cards',
                  style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreditCardSliderRepeatDown(),
                  ),
                );
              },
            ),
            RaisedButton(
              color: kBlue,
              padding: EdgeInsets.all(8),
              child: Text('Credit card slider with repeating cards in both direction',
                  style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreditCardSliderRepeatBothSides(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

Color kPink = Color(0xFFEE4CBF);
Color kRed = Color(0xFFFA3754);
Color kBlue = Color(0xFF4AA3F2);
Color kPurple = Color(0xFFAF92FB);

var _creditCards = [
  CreditCard(
    cardBackground: SolidColorCardBackground(Colors.black.withOpacity(0.6)),
    cardNetworkType: CardNetworkType.visaBasic,
    cardHolderName: 'The boring developer',
    cardNumber: '1234 1234 1234 1234',
    company: CardCompany.yesBank,
    validity: Validity(
      validThruMonth: 1,
      validThruYear: 21,
      validFromMonth: 1,
      validFromYear: 16,
    ),
  ),
  CreditCard(
    cardBackground: SolidColorCardBackground(kRed.withOpacity(0.4)),
    cardNetworkType: CardNetworkType.mastercard,
    cardHolderName: 'Gursheesh Singh',
    cardNumber: '2434 2434 **** ****',
    company: CardCompany.kotak,
    validity: Validity(
      validThruMonth: 1,
      validThruYear: 21,
    ),
  ),
  CreditCard(
    cardBackground: GradientCardBackground(LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [kBlue, kPurple],
      stops: [0.3, 0.95],
    )),
    cardNetworkType: CardNetworkType.mastercard,
    cardHolderName: 'Very Very very boring devloper',
    cardNumber: '4567',
    company: CardCompany.sbiCard,
    validity: Validity(
      validThruMonth: 2,
      validThruYear: 2021,
    ),
  ),
  CreditCard(
    cardBackground: ImageCardBackground(AssetImage('assets/images-card/background_sample.jpg')),
    cardNetworkType: CardNetworkType.mastercard,
    cardHolderName: 'John Doe',
    cardNumber: '2434 2434 **** ****',
    company: CardCompany.virgin,
    validity: Validity(
      validThruMonth: 1,
      validThruYear: 20,
    ),
  ),
  CreditCard(
    cardBackground: ImageCardBackground(AssetImage('assets/images-card/background_sample.jpg')),
    cardNetworkType: CardNetworkType.americanExpress,
    cardHolderName: 'John Doe',
    cardNumber: '2434 2434 **** ****',
    company: CardCompany.virgin,
    validity: Validity(
      validThruMonth: 1,
      validThruYear: 20,
    ),
  ),
  CreditCard(
    cardBackground: ImageCardBackground(AssetImage('assets/images-card/background_sample.jpg')),
    cardNetworkType: CardNetworkType.discover,
    cardHolderName: 'John Doe',
    cardNumber: '2434 2434 **** ****',
    company: CardCompany.virgin,
    validity: Validity(
      validThruMonth: 1,
      validThruYear: 20,
    ),
  ),
  CreditCard(
    cardBackground: ImageCardBackground(AssetImage('assets/images-card/background_sample.jpg')),
    cardNetworkType: CardNetworkType.unionPay,
    cardHolderName: 'John Doe',
    cardNumber: '2434 2434 **** ****',
    company: CardCompany.virgin,
    validity: Validity(
      validThruMonth: 1,
      validThruYear: 20,
    ),
  ),
  CreditCard(
    cardBackground: ImageCardBackground(AssetImage('assets/images-card/background_sample.jpg')),
    cardNetworkType: CardNetworkType.rupay,
    cardHolderName: 'THE BORING DEVELOPER',
    cardNumber: '2434 2434 **** ****',
    company: CardCompany.sbi,
  ),
];

//Opens a credit card slider with initial card as 2

class SimpleCreditCardSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CreditCardSlider(
          _creditCards,
          initialCard: 2,
          onCardClicked: (index) {
            print('Clicked at index: $index');
          },
        ),
      ),
    );
  }
}

class CreditCardSliderRepeatDown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CreditCardSlider(
          _creditCards,
          repeatCards: RepeatCards.down,
        ),
      ),
    );
  }
}

class CreditCardSliderRepeatBothSides extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CreditCardSlider(
          _creditCards,
          repeatCards: RepeatCards.bothDirection,
        ),
      ),
    );
  }
}

*/

/*
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
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
                                      keyboardType: TextInputType.phone,
                                      labelText: "Fecha expiración",
                                      hintText: "10/20",
                                      counterText: "2/2",
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
      ),
    );
  }
}


*/
