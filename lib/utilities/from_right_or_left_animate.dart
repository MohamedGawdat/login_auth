import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class FromRightOrLeftAnimateWithIndex extends StatelessWidget {
  final int index;
  final Widget child;
  const FromRightOrLeftAnimateWithIndex(
      {Key? key, required this.index, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return index.isEven
        ? FadeInRight(
            child: child,
          )
        : FadeInLeft(
            child: child,
          );
  }
}
