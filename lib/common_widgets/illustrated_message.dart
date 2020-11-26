import 'package:fluther/common_widgets/undraw_drawings.dart';
import 'package:flutter/material.dart';
import 'package:undraw/undraw.dart';

class IllustratedMessage extends StatelessWidget {
  const IllustratedMessage({@required this.illustration, @required this.child});
  final UnDrawIllustration illustration;
  final Text child;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        UnDrawDrawings(
          illustration: illustration,
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.width * 0.5,
        ),
        const SizedBox(
          height: 16.0,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: AnimatedDefaultTextStyle(
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2,
              duration: const Duration(milliseconds: 200),
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}
