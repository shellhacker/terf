import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../../email_verification_screen/controller/email_verification_controller.dart';

class mobileVerificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final emailVerificationController =
        Provider.of<EmailVerificationController>(context);
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.07,
            ),
            Text(
              'Verification Code',
              style: GoogleFonts.urbanist(
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontSize: 32.0,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                        'Please enter the verification code that we have sent to your email ',
                    style: GoogleFonts.urbanist(
                      fontSize: 14.0,
                      color: const Color(0xff808d9e),
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                  ),
                  TextSpan(
                    text: '7025361943 ',
                    style: GoogleFonts.urbanist(
                      fontSize: 14.0,
                      color: const Color(0xff005BE0),
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.1,
            ),

            /// pinput package we will use here
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                width: width,
                child: Pinput(
                  controller:
                      emailVerificationController.emailEditingController,
                  length: 4,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  defaultPinTheme: PinTheme(
                    height: 60.0,
                    width: 60.0,
                    textStyle: GoogleFonts.urbanist(
                      fontSize: 24.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black.withOpacity(0.5),
                        width: 1.0,
                      ),
                    ),
                  ),
                  focusedPinTheme: PinTheme(
                    height: 60.0,
                    width: 60.0,
                    textStyle: GoogleFonts.urbanist(
                      fontSize: 24.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 16.0,
            ),
            Center(
              child: Text(
                'Dont Skip the page please complete the verification',
                style: GoogleFonts.urbanist(
                  fontSize: 14.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            /// Continue Button
            const Expanded(child: SizedBox()),
            InkWell(
              onTap: () {
                emailVerificationController.verifyEmailOtp(context);
                print('object');
                //  Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //                 builder: (context) => SignupPage()));
              },
              borderRadius: BorderRadius.circular(30.0),
              child: Ink(
                height: 55.0,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.black,
                ),
                child: Center(
                  child: Text(
                    'Continue',
                    style: GoogleFonts.urbanist(
                      fontSize: 15.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 16.0,
            ),
          ],
        ),
      ),
    );
  }
}
