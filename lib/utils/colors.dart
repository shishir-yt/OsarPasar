import 'package:flutter/material.dart';

class AppColors {
  static const primaryColor = Color.fromRGBO(0, 24, 63, 1);
  static const secondaryColor = Color.fromRGBO(255, 197, 51, 0.08);
  static const tertiaryColor = Color.fromRGBO(255, 194, 37, 1);
  static const backGroundColor = Color(0xFFF5F7F9);
  static const borderColor = Color(0xFFDADCE0);
  static const textColor = Color.fromRGBO(54, 54, 54, 1);
  static const textColorAccent = Color.fromRGBO(177, 177, 177, 1);
  static const whiteTextColor = Color.fromARGB(255, 255, 255, 255);
  static const errorColor = Color(0XFFC1272D);
  static final shimmerBase = Colors.grey.withOpacity(0.40);
  static const Color shimmerHighlight = Color(0xFFE1E1E1);

  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
