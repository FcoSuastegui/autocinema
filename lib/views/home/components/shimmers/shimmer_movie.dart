import 'package:autocinema/themes/size_config.dart';
import 'package:flutter/material.dart';

class ShimmerMovie extends StatelessWidget {
  const ShimmerMovie({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(20),
      ),
      height: getProportionateScreenWidth(80),
      width: double.infinity,
      child: ListView.separated(
        itemCount: 4,
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(5),
        ),
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (_, index) => SizedBox(
          width: getProportionateScreenWidth(10),
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
