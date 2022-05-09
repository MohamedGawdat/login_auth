import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppInputDecorator extends StatelessWidget {
  final Widget child;
  final Widget? label;
  const AppInputDecorator({
    Key? key,
    required this.child,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
        decoration: InputDecoration(
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(
                  color: Colors.grey, width: 2, style: BorderStyle.solid)),
          filled: true,
          label: label ?? const SizedBox(),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 0.02.sw, vertical: 0.01.sw),

          // alignLabelWithHint: false,
        ),
        // expands: true,

        child: child);
  }
}
