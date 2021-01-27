import 'package:flutter/material.dart';

class DividerCustom extends StatelessWidget {
  final String title;
  final EdgeInsetsGeometry padding;
  final double margin, width;

  const DividerCustom({
    Key key,
    this.title,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 0,
    ),
    this.margin = 0.0,
    this.width = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * margin),
      width: size.width * width,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Divider(
              color: Color(0xFFD9D9D9),
              height: 1.5,
            ),
          ),
          Padding(
            padding: padding,
            child: Text(
              title ?? '',
              style: TextStyle(
                color: Colors.black38,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              color: Color(0xFFD9D9D9),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
