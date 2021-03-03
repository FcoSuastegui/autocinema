import 'package:autocinema/app/themes/adapt.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonSocialApleeks extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final Function onPressed;
  final ButtonsApleeks button;

  ButtonSocialApleeks({
    Key key,
    this.text,
    this.onPressed,
    this.button,
    this.textStyle,
  }) : super(key: key);

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    switch (button) {
      case ButtonsApleeks.Google:
        return FlatButton(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                "assets/images/social/google.png",
                height: Adapt.px(40),
              ),
              Text(
                text ?? 'Sign up with Google',
                textAlign: TextAlign.left,
                style: textStyle ??
                    TextStyle(
                      color: Colors.white,
                      fontSize: Adapt.px(15),
                    ),
              ),
            ],
          ),
          color: Color(0xFF4285F4),
          onPressed: onPressed ?? () {},
        );
      case ButtonsApleeks.Facebook:
        return FlatButton(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                "assets/images/social/facebook.png",
                height: Adapt.px(40),
              ),
              Text(
                text ?? 'Sign up with Facebook',
                textAlign: TextAlign.left,
                style: textStyle ??
                    TextStyle(
                      color: Colors.white,
                      fontSize: Adapt.px(15),
                    ),
              ),
            ],
          ),
          color: Color(0xFF3B5998),
          onPressed: onPressed ?? () {},
        );
      case ButtonsApleeks.Apple:
        return FlatButton(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                FontAwesomeIcons.apple,
                color: Colors.white,
                size: Adapt.px(40),
              ),
              Text(
                text ?? 'Sign up with Apple',
                textAlign: TextAlign.left,
                style: textStyle ??
                    TextStyle(
                      color: Colors.white,
                      fontSize: Adapt.px(15),
                    ),
              ),
            ],
          ),
          color: Color(0xFF000000),
          onPressed: onPressed ?? () {},
        );
    }
  }
}

enum ButtonsApleeks {
  Google,
  Facebook,
  Apple,
}
