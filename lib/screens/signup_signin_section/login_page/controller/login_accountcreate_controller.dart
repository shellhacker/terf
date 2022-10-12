import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terf/screens/signup_signin_section/login_page/model/login_accountcreate_model.dart';
import 'package:terf/screens/signup_signin_section/signup_screen/controller/signup_accountcreate_controller.dart';

import '../../../home_page/view/homepage_old.dart';
import '../services/login_service.dart';

class LoginController extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  loginUser(context) async {
    final signupControllerProvider =
        Provider.of<SignupController>(context, listen: false);
    print('----------------------heeeeeeeeeeee------------');

    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Enter valied Data')));
    } else {
      LoginModel value = LoginModel(userMail: email, userPassword: password);
      LoginRespoModel? loginRespoModel =
          await LoginService.instance.userLogin(value, context);
      signupControllerProvider.saveToSharedPref();
      if (loginRespoModel!.status == true) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Homepage()));
      } else if (loginRespoModel.message == null) {
        print('value is null');
      } else {
        print(loginRespoModel.message);
      }
    }
  }
}
