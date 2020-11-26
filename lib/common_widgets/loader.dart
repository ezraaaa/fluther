import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Loader extends StatelessWidget {
  const Loader({this.isLinear, this.isShimmer, this.child, this.color});
  final bool isLinear;
  final bool isShimmer;
  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    if (isLinear == true) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: const LinearProgressIndicator(
          backgroundColor: Colors.transparent,
        ),
      );
    }
    if (isShimmer == true) {
      return Shimmer.fromColors(
        child: child,
        baseColor: Theme.of(context).dividerColor,
        highlightColor: Theme.of(context).dividerColor.withOpacity(0.5),
      );
    }
    return Container(
      height: 17.0,
      width: 17.0,
      child: CircularProgressIndicator(
        backgroundColor: color ?? Theme.of(context).accentColor,
        strokeWidth: 2.0,
      ),
    );
  }
}
