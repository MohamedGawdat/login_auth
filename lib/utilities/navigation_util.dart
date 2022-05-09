import 'package:flutter/material.dart';

import 'connictivity.dart';

class NavigateUtil {
  static Future<dynamic> navigate(BuildContext context, Widget screen,
      [bool clearStack = false]) async {
    if (await checkInternetConnection()) {
      if (clearStack) {
        return Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => screen),
            (Route<dynamic> route) => false);
      } else {
        return Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => screen,
            ));
      }
    }
  }

  static void pop(BuildContext context,
      [dynamic data, bool checkNetwork = true]) async {
    // EasyLoading.dismiss();
    if (checkNetwork) {
      if (await checkInternetConnection()) {
        Navigator.pop(context, data);
      }
    } else {
      Navigator.pop(context, data);
    }
  }
}
