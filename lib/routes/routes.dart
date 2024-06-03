import 'package:e_learning/screen/Onboarding/onboardingscreen.dart';
import 'package:e_learning/screen/authentication/loginscreen/view/loginScreen.dart';
import 'package:e_learning/screen/authentication/registerscreen/view/register.dart';

import 'package:e_learning/screen/splashscreen/splashscreen.dart';
import 'package:get/get.dart';

const routeOnboarding = "/Onboarding";
const routerSplashScreen = "/SplashScreen";
const routerLoginScreen = "/Studentlogin";
const routerRegisterScreen = "/StudentRegister";
const routeHomeScreen = "/HomeScreen";

class routes {
  static final route = [
    GetPage(name: routeOnboarding, page: () => OnboardingScreen()),
    GetPage(name: routerSplashScreen, page: () => splashScreen()),
    GetPage(name: routerLoginScreen, page: () => StudentLogin()),
    GetPage(name: routerRegisterScreen, page: () => StudentRegister()),
  ];
}
