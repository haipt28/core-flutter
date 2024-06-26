import 'package:flutter/material.dart';
import 'package:go/styles/app_colors.dart';

darkTheme(BuildContext context) {
  const MaterialColor white = MaterialColor(
    0xFFFFFFFF,
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFFFFFFF),
      200: Color(0xFFFFFFFF),
      300: Color(0xFFFFFFFF),
      400: Color(0xFFFFFFFF),
      500: Color(0xFFFFFFFF),
      600: Color(0xFFFFFFFF),
      700: Color(0xFFFFFFFF),
      800: Color(0xFFFFFFFF),
      900: Color(0xFFFFFFFF),
    },
  );
  ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: white,
    scaffoldBackgroundColor: const Color(0xff333333),
    primaryColor: Colors.white,
    // textTheme: Theme.of(context).textTheme.apply(
    //       bodyColor: Colors.white, // text color
    //       displayColor: AppColors.white,
    //       fontFamily: 'Roboto',
    //     ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: AppColors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: AppColors.white,
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        color: AppColors.white,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    ),
    appBarTheme: const AppBarTheme(
      // iconTheme: IconThemeData(color: Colors.blueAccent),
      foregroundColor: Colors.white,
      elevation: 0,
      backgroundColor: Color(0xff333333),
    ),

    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(AppColors.black),
      fillColor: MaterialStateProperty.all(AppColors.white),
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF55595D),
      splashColor: Color(0xFF73787C),
      foregroundColor: Colors.white,
    ),
    iconTheme: const IconThemeData(color: Colors.white),
  );
  return darkTheme;
}
