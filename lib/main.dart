import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terf/screens/home_page/controller/home%20_data_getting_controller.dart';
import 'package:terf/screens/home_page/model/home_model.dart';
import 'package:terf/screens/signup_signin_section/email_verification_screen/controller/email_verification_controller.dart';
import 'package:terf/screens/signup_signin_section/login_page/controller/login_accountcreate_controller.dart';
import 'package:terf/screens/signup_signin_section/login_page/view/login_screen.dart';
import 'package:terf/screens/signup_signin_section/mobile_verification_screen/controller/mobile_otp_controlller.dart';
import 'package:terf/screens/signup_signin_section/onboard_screens/view/onboard_page.dart';
import 'package:terf/screens/signup_signin_section/signup_screen/controller/signup_accountcreate_controller.dart';
import 'package:terf/screens/signup_signin_section/signup_screen/view/signup_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignupController()),
        // ChangeNotifierProvider(create: (_) => LocationController()),
        ChangeNotifierProvider(create: (_) => EmailVerificationController()),
        ChangeNotifierProvider(create: (_) => LoginController()),
        // ChangeNotifierProvider(create: (_) => LoginService()),
        ChangeNotifierProvider(create: (_) => MobileOtpController()),
        ChangeNotifierProvider(create: (_) => HomeDataGetController()),
        FutureProvider<TurfeMainDataModel?>(
          create: (context) => HomeDataGetController().getTurfData(),
          initialData: null,
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginPage(),
      ),
    );
  }
}
