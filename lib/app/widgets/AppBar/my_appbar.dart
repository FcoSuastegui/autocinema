import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  MyAppBar({
    String appBarTitle,
    IconData leadingIcon,
    BuildContext context,
    List<Widget> actions,
  }) : super(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            appBarTitle ?? '',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          leading: BackButton(
            color: Colors.black87,
          ),
          actions: actions,
        );
}
