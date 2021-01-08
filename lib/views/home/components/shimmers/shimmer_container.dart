import 'package:autocinema/themes/size_config.dart';
import 'package:flutter/material.dart';

class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: getProportionateScreenWidth(180),
      color: Colors.white,
    );
  }
}
