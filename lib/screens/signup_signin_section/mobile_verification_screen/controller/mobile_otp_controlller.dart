import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:terf/screens/signup_signin_section/mobile_verification_screen/model/mobile_verification_model.dart';

import '../services/mobile_verification_services.dart';
import '../view/mobile_otp_verfication_screen.dart';

class MobileOtpController extends ChangeNotifier {
  final mobileNumberTextfield = TextEditingController();

  loginMobileOtp(context) {
    final mobileVerificationServiceProvider =
        Provider.of<MobileVerificationServices>(context, listen: false);

    final number = mobileNumberTextfield.text.trim();

    if (number.isEmpty) {
      const Text('empty qurie');
    } else {
      MobileVerificationModel value = MobileVerificationModel(
        number: number,
      );
      mobileVerificationServiceProvider.otpverfyimg(value.tojson());
      saveToSharedPrefMobilrOtp();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const MobileVerificationScreen()));
    }
  }

  saveToSharedPrefMobilrOtp() async {
    //shared preference

    final sharedPrefrence = await SharedPreferences.getInstance();
    //save value
    sharedPrefrence.setString(
        'mobilenumber', mobileNumberTextfield.text.trim());
  }
}
