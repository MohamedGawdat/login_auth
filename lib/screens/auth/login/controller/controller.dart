import 'package:auth_login/utilities/navigation_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../data/cache/AppCache.dart';
import '../../../../data/models/users/user_model.dart';
import '../../../../data/network/ApiManager.dart';
import '../../../../data/network/ApiResponse.dart';
import '../../../../data/network/RequestBody.dart';
import '../../../../utilities/alert_dialog.dart';
import '../../../home/ui/home_screen.dart';

class LoginController with ChangeNotifier {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  TextEditingController emailController = TextEditingController();
  TextEditingController passWordController = TextEditingController();

  _showErrorMsg({String? msg}) {
    DialogUtil.showMsgDialog(
      message: msg ?? 'حدث خطأ',
    );
  }

  _loginManager(BuildContext context, {required User user}) {
    AppCache.saveUser(user);
    NavigateUtil.navigate(
      context,
      const HomeScreen(),
    );
  }

  loginReq(BuildContext context) async {
    try {
      final RequestBody requestBody = RequestBody({
        "Email": emailController.text,
        "Password": passWordController.text,
      });

      final ApiResponse apiResponse = await ApiManager.sendRequest(
        link: "login",
        // body: requestBody,
      );

      if (apiResponse.isSuccess) {
        User user = User.fromJson(apiResponse.data!);

        _loginManager(context, user: user);
      } else {}
    } catch (e) {
      _showErrorMsg();
    }
  }

  Future<void> googleLogin(BuildContext context) async {
    try {
      await _googleSignIn.signIn();
      User user = User.fromJson({
        "email": _googleSignIn.currentUser!.email,
      });
      _loginManager(context, user: user);
    } catch (error) {
      _showErrorMsg();
    }
  }
}
