import 'package:autocinema/app/themes/adapt.dart';
import 'package:autocinema/app/themes/app_theme.dart';
import 'package:flutter/material.dart';

class OnBoardingContent extends StatelessWidget {
  final String title, subtitle, slide, image;
  final double marginVertical;

  const OnBoardingContent({
    @required this.slide,
    @required this.title,
    this.subtitle = '',
    this.image = '',
    this.marginVertical = 0,
  }) : assert(title != null);
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          height: Adapt.screenHeight,
          decoration: BoxDecoration(
            color: AppTheme.kPrimaryColor,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(slide),
            ),
          ),
        ),
      ],
    );
  }
}
