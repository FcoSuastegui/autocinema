import 'package:autocinema/themes/size_config.dart';
import 'package:autocinema/views/home/components/shimmers/shimmer_container.dart';
import 'package:autocinema/views/home/components/shimmers/shimmer_movie.dart';
import 'package:flutter/material.dart';

class ShimmerMain extends StatelessWidget {
  const ShimmerMain({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: getProportionateScreenWidth(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ShimmerContainer(),
          const ShimmerMovie(),
          const ShimmerContainer(),
          const ShimmerMovie(),
        ],
      ),
    );
  }
}
