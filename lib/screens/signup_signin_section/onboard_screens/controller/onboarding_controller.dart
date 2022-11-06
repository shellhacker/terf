// ignore: file_names
// ignore: file_names

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:terf/screens/signup_signin_section/login_page/view/login_screen.dart';

class SplashScreenController extends ChangeNotifier {
  bool onboardverify = false;
  getSavedData(context) async {
    onboardverify = true;
    final sharedPrefrence = await SharedPreferences.getInstance();
    onboardverify = sharedPrefrence.setBool('email', onboardverify) as bool;

    final savedEmailValue = sharedPrefrence.getBool('onboardverify');

    if (onboardverify == true) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));

      // Navigator.push(context,
      //     MaterialPageRoute(builder: (context) => const BottumSreen()));
    }
    // else {
    //   Navigator.push(
    //       context, MaterialPageRoute(builder: (context) => const LoginPage()));
    // }
  }
}
