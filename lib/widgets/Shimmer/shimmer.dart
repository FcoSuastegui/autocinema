import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerApleeks extends StatelessWidget {
  final bool enabled;
  final Widget child;
  const ShimmerApleeks({
    Key key,
    this.enabled = true,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 16.0,
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300],
        highlightColor: Colors.grey[100],
        enabled: enabled,
        child: child,
      ),
    );
  }
}
