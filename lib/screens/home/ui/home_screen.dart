import 'package:auth_login/data/cache/AppCache.dart';
import 'package:auth_login/style/app_text_style.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hello',
          style: AppTextStyle.mainTextStyle,
        ),
      ),
      body: Center(
        child: Text(AppCache.getUser()!.email!),
      ),
    );
  }
}
