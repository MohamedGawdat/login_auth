import 'package:auth_login/screens/auth/login/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../style/app_text_style.dart';
import '../../../../widgets/components/AppTextFields/app_text_fields.dart';
import '../../../../widgets/components/buttons/app_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginController(),
      child: Consumer<LoginController>(
        builder: (context, provider, child) => Scaffold(
            appBar: AppBar(title: const Text('Auth Screen')),
            body: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Welcome Please Login To Continue !',
                        style: AppTextStyle.mediumGreyAppText,
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      AppTextFieldTitleOrLabel(
                        controller: provider.emailController,
                        title: 'Email',
                        showInColumn: true,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AppTextFieldPassword(
                        controller: provider.passWordController,
                        showInColumn: true,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Column(
                        children: [
                          AppBuildButton(
                            showLoader: true,
                            isMainColor: true,
                            title: 'تسجيل الدخول',
                            action: () async {
                              if (_formKey.currentState!.validate()) {
                                await provider.loginReq(context);
                              } else {}
                            },
                          ),
                          TextButton.icon(
                            onPressed: () {
                              provider.googleLogin(context);
                            },
                            icon: const Icon(Icons.email_outlined),
                            label: const Text('Google Login'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
