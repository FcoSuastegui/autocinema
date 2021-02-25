import 'package:autocinema/app/themes/adapt.dart';
import 'package:autocinema/app/widgets/Shimmer/shimmer_movie.dart';
import 'package:flutter/material.dart';

class ShimmerListMovie extends StatelessWidget {
  final Axis scrollDirection;
  final bool isPageList;
  final int itemCount;
  const ShimmerListMovie({
    Key key,
    this.scrollDirection = Axis.vertical,
    this.itemCount = 10,
    this.isPageList = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: Adapt.px(20),
      ),
      width: double.maxFinite,
      height: isPageList ? Adapt.px(400) : null,
      child: ListView.separated(
        itemCount: itemCount,
        padding: EdgeInsets.symmetric(
          horizontal: Adapt.px(5),
        ),
        scrollDirection: scrollDirection,
        physics: BouncingScrollPhysics(),
        shrinkWrap: false,
        separatorBuilder: (_, index) => SizedBox(
          width: Adapt.px(10),
        ),
        itemBuilder: (_, index) {
          return ShimmerMovie();
        },
      ),
    );
  }
}
