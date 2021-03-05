import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertAskAgainDialog extends StatelessWidget {
  final String title, subTitle, positiveButtonText, negativeButtonText;
  final Function onPositiveButtonClicked;
  final String doNotAskAgainText;
  final String dialogKeyName;

  AlertAskAgainDialog({
    this.dialogKeyName,
    this.title,
    this.subTitle,
    this.positiveButtonText,
    this.negativeButtonText,
    this.onPositiveButtonClicked,
    this.doNotAskAgainText,
  });
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoAlertDialog(
            title: Text(
              title ?? 'App Update Available',
              textAlign: TextAlign.center,
            ),
            content: Container(
              margin: const EdgeInsets.only(top: 6.0),
              child: Text(
                subTitle ?? 'Please update the app to continue',
                textAlign: TextAlign.center,
              ),
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text(
                  positiveButtonText ?? 'Update Now',
                ),
                onPressed: onPositiveButtonClicked,
              )
            ],
          )
        : AlertDialog(
            title: Text(
              title ?? 'App Update Available',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0),
            ),
            content: FittedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    subTitle ?? 'Please update the app to continue',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22.0),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(positiveButtonText ?? 'Update Now'),
                onPressed: onPositiveButtonClicked,
              ),
            ],
          );
  }
}
