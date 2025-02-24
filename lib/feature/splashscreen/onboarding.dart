import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../core/constants/colorconstant.dart';
import '../../core/constants/imageconstant.dart';
import '../../core/localvariables.dart';
import '../auth/login_page.dart';
import 'loginsignup.dart';


class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();
  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,
      // autoScrollDuration: 3000,
      // infiniteAutoScroll: true,
      globalHeader: const Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 16, right: 16),
          ),
        ),
      ),
      pages: [
        PageViewModel(
          title: "Choose Your Diet Plan",
          body:
              "Lorem ipsum dolor sit amet consectetur. Nisl cras ultrices aliquet ut porttitor. Risus tellus",
          image: Image.asset(
            ImageConstant.onboarding1,
            height: height * 0.5,
            width: width * 0.5,
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Expert Nutritionist Consulting",
          body:
              "Lorem ipsum dolor sit amet consectetur. Nisl cras ultrices aliquet ut porttitor. Risus tellus",
          image: Image.asset(
            ImageConstant.onboarding2,
            height: height * 0.5,
            width: width * 0.5,
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Get your Diet Food On Your Door Steps",
          body:
              "Lorem ipsum dolor sit amet consectetur. Nisl cras ultrices aliquet ut porttitor. Risus tellus",
          image: Image.asset(
            ImageConstant.onboarding3,
            height: height * 0.5,
            width: width * 0.5,
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Custom Plan According To Your BMI",
          body:
              "Lorem ipsum dolor sit amet consectetur. Nisl cras ultrices aliquet ut porttitor. Risus tellus",
          image: Image.asset(
            ImageConstant.onboarding4,
            height: height * 0.5,
            width: width * 0.5,
          ),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => Splashscreen5()),
      ),
      onSkip: () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => Splashscreen5()),
      ),
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      skip: const Text('Skip',
          style: TextStyle(
              fontWeight: FontWeight.w600, color: ColorConstant.blackColor)),
      next: const Text('Next',
          style: TextStyle(
              fontWeight: FontWeight.w600, color: ColorConstant.primaryColor)),
      done: const Text('Done',
          style: TextStyle(
              fontWeight: FontWeight.w600, color: ColorConstant.primaryColor)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        activeSize: Size(32.0, 10.0),
        color: ColorConstant.indicatorColor,
        activeColor: ColorConstant.primaryColor,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
