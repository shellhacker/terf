import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terf/screens/signup_signin_section/email_verification_screen/email_verification_screen.dart';
import 'package:terf/screens/signup_signin_section/signup_screen/controller/signup_accountcreate_controller.dart';

class SignupRegisterButton extends StatelessWidget {
  const SignupRegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    final singupController = Provider.of<SignupController>(context);

    return GestureDetector(
      onTap: () {
        singupController.createUser(context);
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
          'Register Now',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
