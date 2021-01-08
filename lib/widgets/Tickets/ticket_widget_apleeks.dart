library ticket_widget;

import 'package:flutter/material.dart';

class TicketWidgetApleeks extends StatelessWidget {
  final double width;
  final double height;
  final Widget top, bottom;
  final Color color;
  final bool isCornerRounded;

  TicketWidgetApleeks({
    @required this.width,
    @required this.height,
    @required this.top,
    this.bottom,
    this.color = Colors.white,
    this.isCornerRounded = false,
  });
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TicketClipper(),
      child: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 3),
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: color,
              borderRadius:
                  isCornerRounded ? BorderRadius.circular(20.0) : BorderRadius.circular(0.0),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: top,
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.width / 8.0,
            left: 0,
            right: 0,
            child: bottom,
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.width / 2.5,
            right: 0,
            left: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Container(
                color: Colors.white,
                child: Dash(
                  width: 4.0,
                  height: 3.0,
                  color: Colors.grey[400],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    path.addOval(Rect.fromCircle(center: Offset(0.0, size.height / 1.5), radius: 20.0));
    path.addOval(Rect.fromCircle(center: Offset(size.width, size.height / 1.5), radius: 20.0));

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class Dash extends StatelessWidget {
  final double height;
  final double width;
  final Color color;

  const Dash({this.height = 1, this.width = 3, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashWidth = width;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}
