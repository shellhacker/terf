import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:terf/screens/bottum_screen/view/bottum_screen.dart';
import 'package:terf/screens/signup_signin_section/login_page/view/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(((_) {
      Future.delayed(const Duration(seconds: 3), () => getSavedData(context));
    }));
    return Scaffold(
      body: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          child: Image.asset(
            'https://github.com/shellhacker/terf/blob/master/assets/png-clipart-sport-logo-design-grass-sports-equipment.png',
          ),
        ),
      ),
    );
  }

  getSavedData(context) async {
    final sharedPrefrence = await SharedPreferences.getInstance();
    var loginverify = sharedPrefrence.getBool('keyValue') ?? false;

    if (loginverify == true) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const BottumSreen()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    }
  }
}
