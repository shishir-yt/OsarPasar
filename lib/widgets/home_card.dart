import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:osar_pasar/utils/colors.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    Key? key,
    required this.text,
    required this.iconData,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final IconData iconData;

  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(Get.context!).textTheme;
    var theme = Theme.of(Get.context!);
    return Material(
      borderRadius: BorderRadius.circular(10),
      color: const Color(0xff00183F),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        splashColor: Colors.grey.withOpacity(0.1),
        child: SizedBox(
          height: 104,
          width: Get.height / 5,
          child: Center(
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 10.0,
              children: [
                Icon(
                  iconData,
                  color: Colors.white,
                ),
                Text(
                  text,
                  style: textTheme.bodyMedium!
                      .copyWith(fontSize: 14, color: AppColors.whiteTextColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
