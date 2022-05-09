import 'package:flutter/material.dart';

AppBar buildAppBar({
  Widget? title,
  Widget? leading,
  List<Widget>? actions,
  // bool showBackButton = true,
  Color? bgColor,
  bool showNotificationIcon = true,
}) {
  return AppBar(
    backgroundColor: bgColor,
    leading: leading,
    // leading: showBackButton ? null : const SizedBox(),
    // actions: [IconButton(
    //   onPressed: (){
    //     NavigateUtil.pop(context);
    //   },
    //   icon:Icon(Icons.arrow_back_ios,))],
    title: title,
    actions: actions,
  );
}
