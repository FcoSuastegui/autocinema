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
        return OutlineButton(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                FontAwesomeIcons.google,
                color: Colors.white,
                size: Adapt.px(40),
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
          color: Colors.transparent,
          splashColor: Colors.white30,
          highlightedBorderColor: Colors.white,
          borderSide: BorderSide(color: Colors.white),
          onPressed: onPressed ?? () {},
        );
      case ButtonsApleeks.Facebook:
        return OutlineButton(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                FontAwesomeIcons.facebook,
                color: Colors.white,
                size: Adapt.px(40),
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
          color: Colors.transparent,
          splashColor: Colors.white30,
          highlightedBorderColor: Colors.white,
          borderSide: BorderSide(color: Colors.white),
          onPressed: onPressed ?? () {},
        );
      case ButtonsApleeks.Apple:
        return OutlineButton(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                FontAwesomeIcons.apple,
                color: Colors.white,
                size: Adapt.px(50),
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
          color: Colors.transparent,
          splashColor: Colors.white30,
          highlightedBorderColor: Colors.white,
          borderSide: BorderSide(color: Colors.white),
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
