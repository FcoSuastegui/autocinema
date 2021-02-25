import 'package:autocinema/app/themes/adapt.dart';
import 'package:flutter/material.dart';

class ShimmerMovie extends StatelessWidget {
  const ShimmerMovie({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 20.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100.0,
            height: 100.0,
            color: Colors.white,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: Adapt.px(400),
                height: Adapt.px(20),
                color: Colors.white,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: Adapt.px(10)),
              ),
              Container(
                width: Adapt.px(300),
                height: Adapt.px(20),
                color: Colors.white,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: Adapt.px(10)),
              ),
              Container(
                width: Adapt.px(400),
                height: Adapt.px(20),
                color: Colors.white,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: Adapt.px(10)),
              ),
              Container(
                width: Adapt.px(300),
                height: Adapt.px(20),
                color: Colors.white,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: Adapt.px(10)),
              ),
              Container(
                width: Adapt.px(400),
                height: Adapt.px(20),
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
