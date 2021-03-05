import 'package:autocinema/app/themes/app_theme.dart';
import 'package:flutter/material.dart';

class AlertAction extends StatelessWidget {
  final String title, buttonLabelYes, buttonLabelNo;
  final Color buttonColorYes, buttonColorNo, buttonColorTextYes, buttonColorTextNo;
  final Function onPressYes;
  final bool activeButton;

  AlertAction({
    @required this.title,
    this.onPressYes,
    this.buttonLabelYes,
    this.buttonLabelNo,
    this.buttonColorYes = AppTheme.kPrimaryColor,
    this.buttonColorNo = AppTheme.kCancel,
    this.buttonColorTextYes = Colors.white,
    this.buttonColorTextNo = Colors.white,
    this.activeButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      title: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 12),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    onPressYes != null
                        ? Expanded(
                            child: GestureDetector(
                              onTap: onPressYes,
                              child: Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.only(left: 0, right: 5, top: 20, bottom: 0),
                                decoration: BoxDecoration(
                                  color: buttonColorYes,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                ),
                                child: Text(
                                  buttonLabelYes ?? 'Si',
                                  style: TextStyle(
                                    color: buttonColorTextYes,
                                    fontSize: 17,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          )
                        : SizedBox.shrink(),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(left: 5, right: 0, top: 20, bottom: 0),
                          decoration: BoxDecoration(
                            color: buttonColorNo,
                            border: Border.all(color: Colors.black54, width: 0.5),
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                          ),
                          child: Text(
                            buttonLabelNo ?? 'No',
                            style: TextStyle(
                              color: buttonColorTextNo,
                              fontSize: 17,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
