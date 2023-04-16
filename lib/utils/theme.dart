import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData basicTheme() {
  TextTheme basicTextTheme() {
    return ThemeData.light()
        .textTheme
        .copyWith(
          titleLarge: const TextStyle(
            fontFamily: "PlusJakartaSans",
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
          titleMedium: const TextStyle(
              fontFamily: "PlusJakartaSans",
              fontWeight: FontWeight.w600,
              fontSize: 18),
          titleSmall: const TextStyle(
              fontFamily: "PlusJakartaSans",
              fontWeight: FontWeight.w600,
              fontSize: 16),
          bodyLarge: const TextStyle(
              fontFamily: "PlusJakartaSans",
              fontWeight: FontWeight.w500,
              fontSize: 16),
          bodyMedium: const TextStyle(
              fontFamily: "PlusJakartaSans",
              fontWeight: FontWeight.w400,
              fontSize: 16),
          bodySmall: const TextStyle(
              fontFamily: "PlusJakartaSans",
              fontWeight: FontWeight.w300,
              fontSize: 16),
        )
        .apply(
            bodyColor: AppColors.textColor,
            displayColor: AppColors.textColor,
            fontFamily: "PlusJakartaSans");
  }

  return ThemeData.light().copyWith(
    textTheme: basicTextTheme(),
    colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: AppColors.primaryColor,
        secondary: AppColors.secondaryColor,
        tertiary: AppColors.tertiaryColor,
        outline: AppColors.borderColor,
        onError: AppColors.errorColor),
    scaffoldBackgroundColor: AppColors.backGroundColor,
    hintColor: AppColors.whiteTextColor,
    errorColor: AppColors.errorColor,
    backgroundColor: AppColors.backGroundColor,
  );
}
