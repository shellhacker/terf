import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terf/screens/widgets/const.dart';

import '../controller/mobile_otp_controlller.dart';

class MobilesignupScreen extends StatelessWidget {
  const MobilesignupScreen({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    final mobileotpController = Provider.of<MobileOtpController>(context);
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        height: height,
        child: Stack(
          children: <Widget>[
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
                      controller: mobileotpController.mobileNumberTextfield,
                      decoration: const InputDecoration(
                          hintText: 'Mobile Number',
                          border: InputBorder.none,
                          fillColor: Color.fromARGB(255, 201, 201, 203),
                          filled: true),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Number is empty';
                        }
                        return null;
                      },
                    ),
                    kheight20,
                    const SizedBox(
                      height: 20,
                    ),
                    _submitButton(context),
                    kheight20,
                    InkWell(
                      onTap: () {
                        // mobileotpController.loginMobileOtp(context);
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             mobileVerificationScreen()));
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
                      children: const [
                        Divider(
                          thickness: 2,
                          height: 2,
                        ),
                        Text('or'),
                        Divider(
                          thickness: 2,
                          height: 2,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.swap_vert))
                      ],
                    )
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
    final mobileOtpcontroller = Provider.of<MobileOtpController>(context);
    return GestureDetector(
      onTap: () {
        mobileOtpcontroller.loginMobileOtp(context);
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
          'Login',
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
