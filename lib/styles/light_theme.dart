import 'package:flutter/material.dart';
import 'package:go/styles/app_colors.dart';

lightTheme(BuildContext context) {
  const MaterialColor black = MaterialColor(
    0xFF000000,
    <int, Color>{
      50: Color(0xFF000000),
      100: Color(0xFF000000),
      200: Color(0xFF000000),
      300: Color(0xFF000000),
      400: Color(0xFF000000),
      500: Color(0xFF000000),
      600: Color(0xFF000000),
      700: Color(0xFF000000),
      800: Color(0xFF000000),
      900: Color(0xFF000000),
    },
  );
  ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: black,
    primaryColor: AppColors.black,
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    // textTheme: Theme.of(context).textTheme.apply(
    //       bodyColor: AppColors.primaryColor,
    //       displayColor: AppColors.primaryColor,
    //     ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: AppColors.black,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: AppColors.black,
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        color: AppColors.black,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    ),
    fontFamily: 'Roboto',
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Color(0xffffffff),
      foregroundColor: Colors.black,
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(AppColors.white),
      fillColor: MaterialStateProperty.all(AppColors.grey),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.blueLight,
      splashColor: AppColors.blueDark,
      foregroundColor: Colors.white,
    ),
    iconTheme: const IconThemeData(color: AppColors.black),
  );

  return lightTheme;
}
