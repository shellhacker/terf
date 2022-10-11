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
    //save value
    sharedPrefrence.setString('email', emailController.text.trim());
    sharedPrefrence.setString('password', passwordController.text.trim());
  }

  getSavedData(context) async {
    final sharedPrefrence = await SharedPreferences.getInstance();
    final savedEmailValue = sharedPrefrence.getString('email');
    final savedPasswordValue = sharedPrefrence.getString('password');
    if (savedEmailValue != null || savedPasswordValue != null) {
      // Navigator.push(
      // context, MaterialPageRoute(builder: (context) => Homepage())
      // );
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    }
  }

  clearSavedData(context) async {
    final sharedPrefrence = await SharedPreferences.getInstance();
    sharedPrefrence.remove('email');
    sharedPrefrence.remove('password');

    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => Homepage()));
  }

  // ignore: non_constant_identifier_names
  String? SignupPsswrdValidation(value) {
    if (value!.isEmpty && value == null) {
      return 'Password is empty';
    }
    return null;
  }

  // ignore: non_constant_identifier_names
  String? SignupEmailValidation(value) {
    if (value!.isEmpty && value == null) {
      return 'Email is empty';
    }
    return null;
  }
}
