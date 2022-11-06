import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:terf/screens/signup_signin_section/login_page/view/login_screen.dart';
import 'package:terf/screens/signup_signin_section/signup_screen/model/signup_accountcreate_model.dart';
import 'package:terf/screens/signup_signin_section/signup_screen/services/signup_service.dart';

import '../../email_verification_screen/email_verification_screen.dart';

class SignupController extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  SignUpRespoModel? signUpRespoModel;

  bool sharedPrefferenceboolcheck = false;

  void createUser(context) async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      return;
    } else {
      SignUpModel value = SignUpModel(userMail: email, userPassword: password);
      signUpRespoModel =
          await SignupService.instance.signupUser(value, context);
      if (signUpRespoModel!.status == true) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const PinCodeVerificationScreen('shabanasshas@gmail.com')),
        );
      }
    }
    saveToSharedPref();
  }

  saveToSharedPref() async {
    //shared preference

    final sharedPrefrence = await SharedPreferences.getInstance();
    sharedPrefrence.setBool("keyValue", true);
  }

  clearSavedData(context) async {
    final sharedPrefrence = await SharedPreferences.getInstance();
    sharedPrefrence.remove('keyValue');

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  }

  String? signupPsswrdValidation(value) {
    if (value!.isEmpty && value == null) {
      return 'Password is empty';
    }
    return null;
  }

  String? signupEmailValidation(value) {
    if (value!.isEmpty && value == null) {
      return 'Email is empty';
    }
    return null;
  }
}
