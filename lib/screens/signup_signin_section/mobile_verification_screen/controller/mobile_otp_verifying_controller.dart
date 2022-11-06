import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:terf/screens/home_page/view/homepage.dart';
import 'package:terf/screens/signup_signin_section/mobile_verification_screen/model/mobile_verification_model.dart';

import '../services/otp_verififaction_service.dart';
import 'mobile_number_login_controlller.dart';

class OtpController extends ChangeNotifier {
  final mobileOtpTextfield = TextEditingController();

  mobileOtpVerify(context) async {
    final mobileNumberVerifyController =
        Provider.of<MobileNumberVerifyController>(context, listen: false);

    final mobileOtp = mobileOtpTextfield.text.trim();

    if (mobileOtp.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Enter valied Data')));
    } else {
      MobileVerificationResponseModel value = MobileVerificationResponseModel(
          otp: mobileOtp,
          id: mobileNumberVerifyController.mobileVerificationModel!.id);

      MobileVerificationResponseModel? mobileVerificationResponseModel =
          await OtpVerificationServices.instans.mobileOtpVerfyimg(value);
      if (mobileVerificationResponseModel!.status == true) {
        saveToSharedPrefMobilrOtp();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Homepage()));
      }
    }
  }

  saveToSharedPrefMobilrOtp() async {
    //shared preference

    final sharedPrefrence = await SharedPreferences.getInstance();
    //save value///////
    // sharedPrefrence.setString('mobilenumber', mobileOtpTextfield.text.trim());
  }
}
