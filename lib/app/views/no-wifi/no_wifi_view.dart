import 'package:autocinema/app/themes/adapt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NoWifiView extends StatelessWidget {
  static final String routeName = '/no-wifi';
  const NoWifiView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              "assets/images/wifi-offline.png",
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.15,
              left: MediaQuery.of(context).size.width * 0.25,
              right: MediaQuery.of(context).size.width * 0.25,
              child: Container(
                height: MediaQuery.of(context).size.width * 0.12,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 13),
                      blurRadius: 25,
                      color: Colors.black.withOpacity(0.17),
                    ),
                  ],
                ),
                child: FlatButton(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  onPressed: () {},
                  child: Text(
                    "try".tr.capitalize,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: Adapt.px(15),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
