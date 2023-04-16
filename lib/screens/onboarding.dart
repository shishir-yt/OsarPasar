import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/onBoarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final c = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx((() {
                return c.onBoardItems[c.current_index.value];
              })),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < 3; i++)
                        Obx(
                          () => Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Container(
                              margin: const EdgeInsets.only(right: 8),
                              height: 6,
                              width: (c.current_index.value == i) ? 8 : 8,
                              decoration: BoxDecoration(
                                  color: (c.current_index.value == i)
                                      ? const Color(0xff00183F)
                                      : const Color.fromARGB(
                                          255, 182, 182, 182),
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff00183F),
                    minimumSize: const Size.fromHeight(50),
                  ),
                  onPressed: c.onNextTap,
                  child: const Text("Next"),
                ),
              ),
              Obx(
                (() {
                  return Visibility(
                    visible: c.current_index.value != 0,
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 16),
                      child: OutlinedButton(
                        onPressed: c.onPreviousTap,
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            width: 1.0,
                            color: Color(0xff00183F),
                          ),
                        ),
                        child: const Text(
                          'Previous',
                          style: TextStyle(
                            color: Color(0xff00183F),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              )
            ],
          ),
          Obx(
            // ignore: unrelated_type_equality_checks
            (() => (c.current_index !=
                    c.onBoardItems.length - 1) //ternary operation
                ? Positioned(
                    //true huda kheri
                    top: 12,
                    right: 20,
                    child: TextButton(
                      onPressed: c.onSkip,
                      child: const Text(
                        "Skip",
                        style: TextStyle(
                          color: Color(0xff00183F),
                        ),
                      ),
                    ),
                  )
                : Container()), //false huda kheri
          ),
        ],
      ),
    );
  }
}
