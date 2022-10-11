import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terf/screens/home_page/view/homepage_old.dart';
import 'package:terf/screens/signup_signin_section/email_verification_screen/model/signup_email_verify_model.dart';

import '../../signup_screen/controller/signup_accountcreate_controller.dart';
import '../services/email_verification_saervices.dart';

class EmailVerificationController extends ChangeNotifier {
  final emailEditingController = TextEditingController();

  verifyEmailOtp(context) async {
    final emailOtp = emailEditingController.text.trim();
    if (emailOtp.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Please Enter the Valid Data'),
          backgroundColor: Color.fromARGB(255, 57, 57, 57)));
    } else {
      final signupController =
          Provider.of<SignupController>(context, listen: false);

      SignupEmailVerifyModel value = SignupEmailVerifyModel(
          userOtp: emailOtp, id: signupController.signUpRespoModel!.id);
      SignupEmailVerifyModel result =
          await EmailVerficationService.emailVerifying(value.tojson());

      if (result.status != false) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Homepage()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(result.message!),
            backgroundColor: Color.fromARGB(255, 64, 65, 64)));
      }
    }
  }
}
