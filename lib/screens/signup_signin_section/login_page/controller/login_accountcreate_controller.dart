import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terf/screens/signup_signin_section/login_page/model/login_accountcreate_model.dart';
import 'package:terf/screens/signup_signin_section/signup_screen/controller/signup_accountcreate_controller.dart';

import '../services/login_service.dart';

class LoginController extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  loginUser(context) {
    final loginServiceProvider =
        Provider.of<LoginService>(context, listen: false);
    final signupControllerProvider =
        Provider.of<SignupController>(context, listen: false);
    print('----------------------heeeeeeeeeeee------------');

    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      const Text('empty qurie');
    } else {
      LoginModel value = LoginModel(userMail: email, userPassword: password);
      loginServiceProvider.userLogin(value.tojson());
      print('djvhjdfjfjjdfndnfndsnndndnfnf');
      signupControllerProvider.saveToSharedPref();
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => Homepage()));
    }
  }
}
