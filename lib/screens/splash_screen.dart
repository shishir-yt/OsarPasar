import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:osar_pasar/controller/splash_controller.dart';
import '../controller/core_controller.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/splash/screen';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreenWidget(),
    );
  }
}

class SplashScreenWidget extends StatefulWidget {
  static const routeName = '/splash/screen';
  SplashScreenWidget({super.key});

  final splashController = Get.find<SplashController>();

  @override
  VideoState createState() => VideoState();
}

class VideoState extends State<SplashScreenWidget>
    with SingleTickerProviderStateMixin {
  var _visible = true;

  late AnimationController animationController;
  late Animation<double> animation;

  final coreController = Get.put(CoreController());

  // startTime() async {
  //   var duration = const Duration(seconds: 4);
  //   return Timer(duration, navigationPage);
  // }

  // void navigationPage() {
  //   if (coreController.isFirstTimeUser()) {
  //     Get.off(() => const OnBoarding());
  //   } else if (coreController.isUserLoggedIn()) {
  //     Get.off(() => HomePage());
  //   } else {
  //     Get.off(() => Login());
  //   }
  // }

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final c = Get.find<CoreController>();
    // Timer(const Duration(seconds: 3), () {
    //   if (c.isUserLoggedIn()) {
    //     Get.offAndToNamed(HomePage.routeName);
    //   } else if (coreController.isFirstTimeUser()) {
    //     Get.off(() => const OnBoarding());
    //   } else {
    //     Get.offAndToNamed(Login.routeName);
    //   }
    // });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: animation.value * 250,
                height: animation.value * 250,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
