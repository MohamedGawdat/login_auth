import 'package:flutter/material.dart';

import '../../style/app_colors.dart';

// import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppHorizontalDivider extends StatelessWidget {
  final double thickness;
  final double? width;
  final double? height;
  final Color? color;
  const AppHorizontalDivider({
    Key? key,
    this.thickness = 1.5,
    this.color,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Divider(
        thickness: thickness,
        color: color,
        // color: ,
      ),
    );
  }
}

class AppVerticalDivider extends StatelessWidget {
  final double thickness;
  final double? height;
  final Color color;
  const AppVerticalDivider(
      {Key? key,
      this.thickness = 1.5,
      this.color = AppColors.greyColor,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: VerticalDivider(
        thickness: thickness, color: color,

        // color: ,
      ),
    );
  }
}
