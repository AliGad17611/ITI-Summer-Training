import 'package:e_commerce/constants.dart';
import 'package:e_commerce/helper/get_pages.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: IntroductionScreen(
          pages: getPages(context),
          onDone: () {},
          onSkip: () {},
          showSkipButton: false,
          showNextButton: true,
          showBackButton: true,
          showDoneButton: false,
          next: const Text('Next', style: TextStyle(color: kPrimaryColor)),
          back: const Text('Back', style: TextStyle(color: kPrimaryColor)),
          curve: Curves.fastLinearToSlowEaseIn,
          controlsMargin: const EdgeInsets.all(16),
          controlsPadding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
          dotsDecorator: const DotsDecorator(
            size: Size(10.0, 10.0),
            color: kPrimaryColor,
            activeSize: Size(22.0, 10.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
        ),
      ),
    );
  }
}
