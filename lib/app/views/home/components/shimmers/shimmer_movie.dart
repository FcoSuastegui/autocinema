import 'package:autocinema/app/themes/adapt.dart';
import 'package:flutter/material.dart';

class ShimmerMovie extends StatelessWidget {
  const ShimmerMovie({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: Adapt.px(20),
      ),
      height: Adapt.px(200),
      width: double.infinity,
      child: ListView.separated(
        itemCount: 4,
        padding: EdgeInsets.symmetric(
          horizontal: Adapt.px(5),
        ),
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (_, index) => SizedBox(
          width: Adapt.px(10),
        ),
        itemBuilder: (_, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 120,
                height: 20.0,
                color: Colors.white,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 2.0),
              ),
              Container(
                width: 120,
                height: 20.0,
                color: Colors.white,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 2.0),
              ),
              Container(
                width: 40.0,
                height: 20.0,
                color: Colors.white,
              ),
            ],
          );
        },
      ),
    );
  }
}
