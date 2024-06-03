import "package:e_learning/routes/routes.dart";
import "package:e_learning/screen/Onboarding/intoscreen.dart";
import "package:e_learning/screen/splashscreen/splashscreen.dart";
import "package:e_learning/utililts/constant/constant.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:intro_screen_onboarding_flutter/introduction.dart";

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Introduction> list = [
      Introduction(
        title: starttitle1,
        subTitle: subTitle1,
        imageUrl: 'asset/images/boardingimg1.png',
      ),
      Introduction(
        title: starttitle2,
        subTitle: starttitle2,
        imageUrl: 'asset/images/boardingimg2.png',
      ),
      Introduction(
        title: starttitle3,
        subTitle: subTitle3,
        imageUrl: 'asset/images/boardingimg3.png',
      ),
    ];
    return IntroScreenOnBoarding(
      backgroudColor: Colors.white,
      introductionList: list,
      onTapSkipButton: () {
        Get.toNamed(routerSplashScreen);
      },
    );
  }
}
