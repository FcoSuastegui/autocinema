import 'package:autocinema/app/views/account/components/account_body.dart';
import 'package:autocinema/app/views/account/components/account_header.dart';
import 'package:flutter/material.dart';

class AccountView extends StatelessWidget {
  static final String routeName = '/account';
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
                const AccountHeader(),
                const AccountBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
