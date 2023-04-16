import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardItems extends StatelessWidget {
  final String imagepath;
  final String title;
  const OnBoardItems({super.key, required this.imagepath, required this.title});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(Get.context!).textTheme;
    var theme = Theme.of(Get.context!);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(imagepath),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title, style: textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }
}
