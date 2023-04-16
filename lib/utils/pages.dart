import 'package:get/get.dart';
import 'package:osar_pasar/controller/home_controller.dart';
import 'package:osar_pasar/controller/onBoarding_controller.dart';
import 'package:osar_pasar/screens/auth/login.dart';
import 'package:osar_pasar/screens/auth/register.dart';
import 'package:osar_pasar/screens/home.dart';
import 'package:osar_pasar/screens/onboarding_screen.dart';

import '../controller/auth/login_controller.dart';
import '../controller/auth/register_controller.dart';
import '../controller/splash_controller.dart';
import '../screens/splash_screen.dart';

var commonPages = [
  GetPage(
      name: SplashScreen.routeName,
      page: (() =>  SplashScreen()),
      binding: BindingsBuilder(() => Get.lazyPut(() => SplashController()))),
  GetPage(
      name: Register.routeName,
      page: ((() => Register())),
      binding:
          BindingsBuilder((() => Get.lazyPut(() => RegisterController())))),
  GetPage(
      name: OnBoarding.routeName,
      page: ((() => const OnBoarding())),
      binding:
          BindingsBuilder((() => Get.lazyPut(() => OnBoardingController())))),
  GetPage(
      name: Login.routeName,
      page: (() => Login()),
      binding: BindingsBuilder(() => Get.lazyPut(() => LoginController()))),
];

var userPages = [
  GetPage(
      name: HomePage.routeName,
      page: (() => HomePage()),
      binding: BindingsBuilder(() => Get.lazyPut(() => HomeController()))),
];
