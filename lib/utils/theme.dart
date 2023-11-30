import 'package:flutter/material.dart';
import 'package:truth_or_truth/utils/const.dart';

class AppColor {
  static const Color primary = Color(0xFF2A2438);
  static const Color secondary = Color(0xFF352F44);
  static const Color tersier = Color(0xFF5C5470);
  static const Color mainColor = Color(0xFFDBD8E3);
  static const Color shadow = Color(0xFF777777);
}

class AppTheme {
  static final ThemeData apptheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColor.mainColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.secondary,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColor.primary,
      ),
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: FontSizes.headlineLarge,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
      ),
      bodyLarge: TextStyle(
        fontSize: FontSizes.bodyLarge,
        fontFamily: 'Poppins',
      ),
      headlineMedium: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: FontSizes.headlineMedium,
        fontFamily: 'Poppins',
      ),
      bodyMedium: TextStyle(
        fontSize: FontSizes.bodyMedium,
        fontFamily: 'Poppins',
      ),
      headlineSmall: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: FontSizes.headlineSmall,
        fontFamily: 'Poppins',
      ),
      bodySmall: TextStyle(
        fontSize: FontSizes.bodySmall,
        fontFamily: 'Poppins',
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primary,
        elevation: 2,
        textStyle: const TextTheme().headlineSmall,
        padding: const EdgeInsets.all(5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
  );
}
