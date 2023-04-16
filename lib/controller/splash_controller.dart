import 'dart:async';

import 'package:get/get.dart';
import 'package:osar_pasar/screens/auth/login.dart';
import 'package:osar_pasar/screens/home.dart';
import '../screens/onboarding_screen.dart';
import 'core_controller.dart';

class SplashController extends GetxController {
  final coreController = Get.find<CoreController>();

  @override
  void onInit() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (coreController.isUserLoggedIn()) {
          Get.offAndToNamed(HomePage.routeName);
        } else if (coreController.isFirstTimeUser()) {
          Get.off(() => const OnBoarding());
        } else {
          Get.offAllNamed(Login.routeName);
        }
      },
    );
    super.onInit();
  }
}
