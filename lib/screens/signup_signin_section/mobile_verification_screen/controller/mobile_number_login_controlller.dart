import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:terf/screens/signup_signin_section/mobile_verification_screen/model/mobile_verification_model.dart';

import '../services/mobile_number_verification_services.dart';
import '../view/mobile_otp_verfication_screen.dart';

class MobileNumberVerifyController extends ChangeNotifier {
  final mobileNumberTextfield = TextEditingController();
  MobileVerificationModel? mobileVerificationModel;

  loginMobileNumber(context) async {
    final number = mobileNumberTextfield.text.trim();

    if (number.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Enter valied Data')));
    } else {
      MobileVerificationModel value = MobileVerificationModel(number: number);
      mobileVerificationModel =
          await MobileVerificationServices.instans.mobileNumberVerfyimg(value);
      if (mobileVerificationModel!.status != false) {
        saveToSharedPrefMobilrOtp();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const OtpVerificationScreen()));
      }
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
