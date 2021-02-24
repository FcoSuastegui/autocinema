import 'package:autocinema/app/themes/adapt.dart';
import 'package:flutter/material.dart';

class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Adapt.px(320),
      color: Colors.white,
    );
  }
}
