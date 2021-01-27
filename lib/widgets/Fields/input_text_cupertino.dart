import 'package:autocinema/themes/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputTextCupertino extends StatelessWidget {
  final Stream input;
  final Function(String) onChanged;
  final String placeholder;
  final Widget prefix;

  const InputTextCupertino({
    Key key,
    this.input,
    this.onChanged,
    this.placeholder,
    this.prefix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      height: 40.0,
      child: StreamBuilder(
        stream: input,
        builder: (_, __) => CupertinoTextField(
          clearButtonMode: OverlayVisibilityMode.editing,
          onChanged: onChanged,
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(color: Colors.white),
          placeholder: placeholder,
          prefix: prefix,
          placeholderStyle: Theme.of(context).textTheme.bodyText1.copyWith(
                color: Colors.black26,
                fontSize: getProportionateScreenWidth(14),
              ),
          style: Theme.of(context).textTheme.bodyText1.copyWith(
                color: Colors.black26,
                fontSize: getProportionateScreenWidth(14),
              ),
        ),
      ),
    );
  }
}
