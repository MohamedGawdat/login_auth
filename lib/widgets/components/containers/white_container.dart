import 'package:flutter/material.dart';

import '../../../style/app_colors.dart';

class AppWhiteContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final double? radius;
  final double? padding;
  final EdgeInsetsGeometry? margin;
  final bool showShadow;
  final bool showBorder;
  final BoxBorder? border;

  final Widget? child;
  const AppWhiteContainer({
    Key? key,
    this.width,
    this.height,
    this.radius,
    this.showShadow = false,
    this.showBorder = false,
    this.padding,
    this.margin,
    this.border,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      width: width,
      padding: EdgeInsets.all(padding ?? 0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radius ?? 18),
          boxShadow: showShadow
              ? [
                  const BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 4),
                      blurRadius: 7.0)
                ]
              : null,
          border: showBorder
              ? border ?? Border.all(color: AppColors.greenColor, width: 2)
              : null),
      child: child,
    );
  }
}
