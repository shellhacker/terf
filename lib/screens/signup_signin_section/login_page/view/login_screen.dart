import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:terf/screens/home_page/view/homepage.dart';
import 'package:terf/screens/signup_signin_section/login_page/controller/login_accountcreate_controller.dart';
import 'package:terf/screens/signup_signin_section/login_page/services/login_service.dart';
import 'package:terf/screens/signup_signin_section/signup_screen/view/signup_screen.dart';
import 'package:terf/screens/signup_signin_section/signup_screen/view/widget/beziercontainer_widget.dart';
import 'package:terf/screens/widgets/const.dart';

import '../../email_verification_screen/email_verification_screen.dart';
import '../../mobile_verification_screen/view/mobile_signup_screen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    final loginController = Provider.of<LoginController>(context);
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
                      controller: loginController.emailController,
                      decoration: const InputDecoration(
                          hintText: 'Email',
                          border: InputBorder.none,
                          fillColor: Color.fromARGB(255, 201, 201, 203),
                          filled: true),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Email is empty';
                        }
                        return null;
                      },
                    ),
                    kheight20,
                    TextFormField(
                      controller: loginController.passwordController,
                      decoration: const InputDecoration(
                          hintText: 'Password',
                          border: InputBorder.none,
                          fillColor: Color.fromARGB(255, 201, 201, 203),
                          filled: true),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password is empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _submitButton(context),
                    kheight20,
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupPage()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Text(
                            'Create new account ?',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Signup',
                            style: TextStyle(
                                color: Color(0xfff79c4f),
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    kheight10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Divider(
                          thickness: 2,
                          height: 2,
                        ),
                        const Text('or'),
                        const Divider(
                          thickness: 2,
                          height: 2,
                        ),
                      ],
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

  Widget _submitButton(context) {
    final logincontroller = Provider.of<LoginController>(context);
    return GestureDetector(
      onTap: () {
        logincontroller.loginUser(context);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: const Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xfffbb448), Color(0xfff7892b)])),
        child: const Text(
          'Login Page',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

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
