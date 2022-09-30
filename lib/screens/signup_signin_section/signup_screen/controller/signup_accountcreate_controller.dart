import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:terf/screens/home_page/view/homepage.dart';
import 'package:terf/screens/signup_signin_section/login_page/view/login_screen.dart';
import 'package:terf/screens/signup_signin_section/signup_screen/model/signup_accountcreate_model.dart';
import 'package:terf/screens/signup_signin_section/signup_screen/services/signup_service.dart';

import '../../email_verification_screen/email_verification_screen.dart';

class SignupController extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  createUser(context) {
    final SignupControllerObj =
        Provider.of<SignupService>(context, listen: false);
    print('----------------------heeeeeeeeeeee------------');

    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      const Text('empty qurie');
    } else {
      SignUpModel value = SignUpModel(userMail: email, userPassword: password);
      SignupControllerObj.signupUser(value.tojson());
      print('djvhjdfjfjjdfndnfndsnndndnfnf');
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const PinCodeVerificationScreen('shabanasshas@gmail.com')),
      );
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
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Homepage()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    }
  }

  clearSavedData(context) async {
    final sharedPrefrence = await SharedPreferences.getInstance();
    sharedPrefrence.remove('email');
    sharedPrefrence.remove('password');

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Homepage()));
  }

  String? SignupPsswrdValidation(value) {
    if (value!.isEmpty) {
      return 'Password is empty';
    }
    return null;
  }

  String? SignupEmailValidation(value) {
    if (value!.isEmpty) {
      return 'Email is empty';
    }
    return null;
  }
}
