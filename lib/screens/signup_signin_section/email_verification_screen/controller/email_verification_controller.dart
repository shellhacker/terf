import 'package:flutter/material.dart';
import 'package:terf/screens/home_page/view/homepage.dart';
import 'package:terf/screens/signup_signin_section/email_verification_screen/model/signup_email_verify_model.dart';

import '../services/email_verification_saervices.dart';

class EmailVerificationController extends ChangeNotifier {
  final emailEditingController = TextEditingController();

  verifyEmailOtp(context) async {
    print('hellooo');

    final emailOtp = emailEditingController.text.trim();
    if (emailOtp.isEmpty) {
      const Text('empty qurie');
    } else {
      SignupEmailVerifyModel value = SignupEmailVerifyModel(userOtp: emailOtp);
      SignupEmailVerifyModel result =
          await EmailVerficationService.emailVerifying(value.tojson());
      print(result.status.toString());

      if (result.status != false) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Homepage()));
      } else {
        print(result.status);
        print(result.message);
      }
    }
  }
}
