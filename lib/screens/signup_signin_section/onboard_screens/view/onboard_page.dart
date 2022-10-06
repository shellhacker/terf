import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: depend_on_referenced_packages
import 'package:onboarding_animation/onboarding_animation.dart';
import 'package:provider/provider.dart';
import 'package:terf/screens/signup_signin_section/signup_screen/controller/signup_accountcreate_controller.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signupControllerProvider = Provider.of<SignupController>(context);

    signupControllerProvider.getSavedData(context);

    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.9),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: OnBoardingAnimation(
            controller: PageController(initialPage: 1),
            pages: const [
              _GetCardsContent(
                image: 'assetskindpng_1154947.png',
                cardContent:
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              ),
              _GetCardsContent(
                image: 'assetskindpng_1154947.png',
                cardContent:
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              ),
              _GetCardsContent(
                image: 'assetskindpng_1154947.png',
                cardContent:
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              ),
            ],
            indicatorDotHeight: 7.0,
            indicatorDotWidth: 7.0,
            indicatorType: IndicatorType.expandingDots,
            indicatorPosition: IndicatorPosition.bottomCenter,
            indicatorJumpScale: 2.0),
      ),
    );
  }
}

class _GetCardsContent extends StatelessWidget {
  final String image, cardContent;

  const _GetCardsContent({
    Key? key,
    this.image = '',
    this.cardContent = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(20.0),
              ),
              child: Image.asset(image),
            ),
            Text(
              cardContent,
              style: GoogleFonts.pacifico(fontSize: 30.0),
            ),
          ],
        ),
      ),
    );
  }
}
