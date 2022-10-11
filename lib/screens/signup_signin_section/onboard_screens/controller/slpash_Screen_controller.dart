// ignore: file_names
// ignore: file_names

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends ChangeNotifier {
  getSavedData(context) async {
    final sharedPrefrence = await SharedPreferences.getInstance();
    final savedEmailValue = sharedPrefrence.getString('email');
    final savedPasswordValue = sharedPrefrence.getString('password');
    if (savedEmailValue != null || savedPasswordValue != null) {
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => Homepage()));
    }
  }
}
