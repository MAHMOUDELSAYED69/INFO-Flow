import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/colors.dart';

abstract class AppTheme {
  //? LIGHT THEME
  static ThemeData get lightTheme {
    return ThemeData(
      switchTheme: const SwitchThemeData(
        trackOutlineColor: WidgetStatePropertyAll(ColorManager.black),
        thumbColor: WidgetStatePropertyAll(ColorManager.black),
        trackColor: WidgetStatePropertyAll(ColorManager.white),
        thumbIcon: WidgetStatePropertyAll(
          Icon(
            Icons.light_mode,
            color: ColorManager.white,
          ),
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: ColorManager.yellow,
        selectionColor: ColorManager.yellow.withOpacity(0.3),
        selectionHandleColor: ColorManager.yellow,
      ),

      iconTheme: const IconThemeData(color: ColorManager.black),
      fontFamily: 'Rubik',
      useMaterial3: true,
      brightness: Brightness.light,
      // primarySwatch: ColorManager.green ,
      scaffoldBackgroundColor: ColorManager.white,
      appBarTheme: AppBarTheme(
        elevation: 1,
        shadowColor: ColorManager.grey,
        centerTitle: true,
        color: ColorManager.white,
        iconTheme: IconThemeData(color: ColorManager.yellow),
        titleTextStyle: TextStyle(
            color: ColorManager.black,
            fontSize: 20.spMin,
            fontWeight: FontWeight.bold),
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
            fontSize: 20.spMin,
            color: ColorManager.black,
            fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(
            fontSize: 16.spMin,
            color: ColorManager.black,
            fontWeight: FontWeight.w500),
        displayMedium: TextStyle(
            fontSize: 16.spMin,
            color: ColorManager.grey,
            fontWeight: FontWeight.w500),
        bodySmall: TextStyle(
          fontSize: 14.spMin,
          fontWeight: FontWeight.w500,
          color: ColorManager.black,
        ),
      ),
    );
  }

  //? DARK THEME
  static ThemeData get darkTheme {
    return ThemeData(
      switchTheme: SwitchThemeData(
        trackOutlineColor: const WidgetStatePropertyAll(ColorManager.black),
        thumbColor: const WidgetStatePropertyAll(ColorManager.black),
        trackColor: WidgetStatePropertyAll(ColorManager.yellow),
        thumbIcon: const WidgetStatePropertyAll(
          Icon(
            Icons.dark_mode,
            color: ColorManager.white,
          ),
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: ColorManager.yellow,
        selectionColor: ColorManager.yellow.withOpacity(0.3),
        selectionHandleColor: ColorManager.yellow,
      ),
      iconTheme: IconThemeData(color: ColorManager.yellow),
      fontFamily: 'Rubik',
      useMaterial3: true,
      brightness: Brightness.light,
      // primarySwatch: ColorManager.green ,
      scaffoldBackgroundColor: ColorManager.black,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 5,
        shadowColor: ColorManager.grey,
        color: ColorManager.black,
        iconTheme: IconThemeData(color: ColorManager.yellow),
        titleTextStyle: TextStyle(
            color: ColorManager.white,
            fontSize: 20.spMin,
            fontWeight: FontWeight.bold),
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
            fontSize: 20.spMin,
            color: ColorManager.white,
            fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(
            fontSize: 16.spMin,
            color: ColorManager.white,
            fontWeight: FontWeight.w500),
        displayMedium: TextStyle(
            fontSize: 16.spMin,
            color: ColorManager.grey,
            fontWeight: FontWeight.w500),
        bodySmall: TextStyle(
          fontSize: 14.spMin,
          fontWeight: FontWeight.w500,
          color: ColorManager.white,
        ),
      ),
    );
  }
}
