import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:terf/screens/signup_signin_section/login_page/controller/login_accountcreate_controller.dart';
import 'package:terf/screens/signup_signin_section/login_page/view/login_screen.dart';
import 'package:terf/screens/signup_signin_section/signup_screen/controller/signup_accountcreate_controller.dart';
import 'package:terf/screens/signup_signin_section/signup_screen/view/widget/register_bttn.dart';
import 'package:terf/screens/signup_signin_section/signup_screen/view/widget/beziercontainer_widget.dart';
import 'package:terf/screens/widgets/const.dart';

import '../../email_verification_screen/email_verification_screen.dart';
import '../../mobile_verification_screen/view/mobile_signup_screen.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    final singupController = Provider.of<SignupController>(context);
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        height: height,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -MediaQuery.of(context).size.height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: const BezierContainer(),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: height * .14),
                    SizedBox(height: height * .2),
                    _title(),
                    const SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      controller: singupController.emailController,
                      decoration: const InputDecoration(
                          hintText: 'Email',
                          border: InputBorder.none,
                          fillColor: Color.fromARGB(255, 201, 201, 203),
                          filled: true),
                      validator: singupController.SignupEmailValidation,
                    ),
                    kheight20,
                    TextFormField(
                      controller: singupController.passwordController,
                      decoration: const InputDecoration(
                          hintText: 'Password',
                          border: InputBorder.none,
                          fillColor: Color.fromARGB(255, 201, 201, 203),
                          filled: true),
                      validator: singupController.SignupPsswrdValidation,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SignupRegisterButton(),
                    kheight20,
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Text(
                            'Already have an account ?',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Login',
                            style: TextStyle(
                                color: Color(0xfff79c4f),
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    kheight10,
                    const Text('or'),
                    const Divider(
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MobilesignupScreen()));
                            },
                            icon: FaIcon(FontAwesomeIcons.mobileScreen)),
                        IconButton(
                            onPressed: () {
                              //                      Navigator.push(
                              // context, MaterialPageRoute(builder: (context) => const Homepage()));
                            },
                            icon: FaIcon(FontAwesomeIcons.google))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget _submitButton(context) {
  //   final singupController = Provider.of<SignupController>(context);

  //   return GestureDetector(
  //     onTap: () {
  //       singupController.createUser(context);
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //             builder: (context) =>
  //                 const PinCodeVerificationScreen('shabanasshas@gmail.com')),
  //       );
  //     },
  //     child: Container(
  //       width: MediaQuery.of(context).size.width,
  //       padding: const EdgeInsets.symmetric(vertical: 15),
  //       alignment: Alignment.center,
  //       decoration: BoxDecoration(
  //           borderRadius: const BorderRadius.all(Radius.circular(5)),
  //           boxShadow: <BoxShadow>[
  //             BoxShadow(
  //                 color: Colors.grey.shade200,
  //                 offset: const Offset(2, 4),
  //                 blurRadius: 5,
  //                 spreadRadius: 2)
  //           ],
  //           gradient: const LinearGradient(
  //               begin: Alignment.centerLeft,
  //               end: Alignment.centerRight,
  //               colors: [Color(0xfffbb448), Color(0xfff7892b)])),
  //       child: const Text(
  //         'Register Now',
  //         style: TextStyle(fontSize: 20, color: Colors.white),
  //       ),
  //     ),
  //   );

  // }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
          text: 'BK',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: Color(0xffe46b10)),
          children: [
            TextSpan(
              text: 'play',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: 'time',
              style: TextStyle(color: Color(0xffe46b10), fontSize: 30),
            ),
          ]),
    );
  }
}
