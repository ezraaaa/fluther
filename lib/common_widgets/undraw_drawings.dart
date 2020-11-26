import 'package:fluther/common_widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:undraw/undraw.dart';

class UnDrawDrawings extends StatelessWidget {
  const UnDrawDrawings({
    @required this.illustration,
    this.color,
    this.width,
    this.height,
    this.padding,
    this.alignment,
  });
  final UnDrawIllustration illustration;
  final Color color;
  final double width;
  final double height;
  final EdgeInsets padding;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return UnDraw(
        padding: padding ?? EdgeInsets.zero,
        illustration: illustration,
        color: color ?? Theme.of(context).primaryColor,
        alignment: alignment ?? Alignment.center,
        width: width ?? MediaQuery.of(context).size.width,
        height: height ?? MediaQuery.of(context).size.width,
        errorWidget: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).dividerColor,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: const <Widget>[
              Icon(Icons.error_outline),
              SizedBox(
                height: 16.0,
              ),
              Text('Could not load image'),
            ],
          ),
        ),
        placeholder: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Loader(
            isShimmer: true,
            child: Container(
              width: width ?? MediaQuery.of(context).size.width,
              height: height ?? MediaQuery.of(context).size.width,
              color: Theme.of(context).dividerColor,
            ),
          ),
        ));
  }
}
