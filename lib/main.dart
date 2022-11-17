import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terf/screens/booking_time_slot/controller/book_time_slot.dart';
import 'package:terf/screens/booking_time_slot/controller/time_slot_converssion.dart';
import 'package:terf/screens/booking_time_slot/controller/colender_controller.dart';
import 'package:terf/screens/bottum_screen/controller/bottum_controller.dart';
import 'package:terf/screens/home_page/controller/home%20_data_getting_controller.dart';
import 'package:terf/screens/home_page/controller/product_details.dart';
import 'package:terf/screens/searchscreen/controller/searchcontroller.dart';
import 'package:terf/screens/signup_signin_section/email_verification_screen/controller/email_verification_controller.dart';
import 'package:terf/screens/signup_signin_section/login_page/controller/login_accountcreate_controller.dart';
import 'package:terf/screens/signup_signin_section/mobile_verification_screen/controller/mobile_number_login_controlller.dart';
import 'package:terf/screens/signup_signin_section/mobile_verification_screen/controller/mobile_otp_verifying_controller.dart';
import 'package:terf/screens/signup_signin_section/signup_screen/controller/signup_accountcreate_controller.dart';
import 'package:terf/services/errror_handler.dart';

import 'screens/home_page/controller/location_controller.dart';
import 'screens/splash_screen/view/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottumControllerScreen()),
        ChangeNotifierProvider(create: (_) => SignupController()),
        ChangeNotifierProvider(create: (_) => GetUserLoction()),
        ChangeNotifierProvider(create: (_) => EmailVerificationController()),
        ChangeNotifierProvider(create: (_) => LoginController()),
        ChangeNotifierProvider(create: (_) => OtpController()),
        ChangeNotifierProvider(create: (_) => MobileNumberVerifyController()),
        ChangeNotifierProvider(create: (_) => NearestDataGetController()),
        ChangeNotifierProvider(create: (_) => GetUserLoction()),
        ChangeNotifierProvider(create: (_) => CalenderController()),
        ChangeNotifierProvider(create: (_) => BookingTimeSLotTimeController()),
        ChangeNotifierProvider(create: (_) => ProductDetailsController()),
        ChangeNotifierProvider(create: (_) => SearchController()),
        ChangeNotifierProvider(create: (_) => CommenErrorHandler()),
        ChangeNotifierProvider(create: (_) => BookFreeTimeSlotController()),
      ],
      child: MaterialApp(
        theme: ThemeData(),
        home: const SplashScreen(),
      ),
    );
  }
}
