import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terf/screens/home_page/controller/location_controller.dart';
import 'package:terf/screens/home_page/view/homepage.dart';
import 'package:terf/screens/signup_signin_section/email_verification_screen/controller/email_verification_controller.dart';
import 'package:terf/screens/signup_signin_section/login_page/controller/login_accountcreate_controller.dart';
import 'package:terf/screens/signup_signin_section/login_page/services/login_service.dart';
import 'package:terf/screens/signup_signin_section/mobile_verification_screen/controller/mobile_otp_controlller.dart';
import 'package:terf/screens/signup_signin_section/mobile_verification_screen/services/mobile_verification_services.dart';
import 'package:terf/screens/signup_signin_section/signup_screen/controller/signup_accountcreate_controller.dart';
import 'package:terf/screens/signup_signin_section/signup_screen/view/signup_screen.dart';

import 'screens/signup_signin_section/signup_screen/services/signup_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignupController()),
        ChangeNotifierProvider(create: (_) => LocationController()),
        ChangeNotifierProvider(create: (_) => EmailVerificationController()),
        ChangeNotifierProvider(create: (_) => LoginController()),
        // ChangeNotifierProvider(create: (_) => LoginService()),
        ChangeNotifierProvider(create: (_) => MobileOtpController()),
        // ChangeNotifierProvider(create: (_) => MobileVerificationServices()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Homepage(),
      ),
    );
  }
}
