import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class AppHTML extends StatelessWidget {
  final String? html;
  const AppHTML({Key? key, required this.html}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return html != null
        ? Html(
            data: html,
            // style: AppTextStyle.smallGreyAppText,
          )
        : const SizedBox();
  }
}
