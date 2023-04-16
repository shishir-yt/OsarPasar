import 'package:flutter/material.dart';
import 'package:osar_pasar/screens/onboarding.dart';

class OnBoarding extends StatelessWidget {
  static const routeName = '/Onboarding';
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingScreen(),
    );
  }
}
