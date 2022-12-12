import 'package:flutter/material.dart';

import 'colors.dart';

class MyTheme {

  ThemeData light = ThemeData(
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: primaryColorLight,
          onPrimary: whiteColor,
          secondary: greenBackground,
          onSecondary: whiteColor,
          error: Colors.red,
          onError: whiteColor,
          background: greenBackground,
          onBackground: primaryColorLight,
          surface: Colors.deepPurple,
          onSurface: whiteColor,
      ),
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColorLight,
      elevation: 0.0,
      titleTextStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    ),
    iconTheme: const IconThemeData(color: whiteColor),
    textTheme: const TextTheme(
      headline1: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: whiteColor),
      subtitle1: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: primaryColorLight),
      subtitle2: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: whiteColor),
      bodyText1: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: greenColor),
    ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: primaryColorLight,
          unselectedItemColor: Colors.grey
      ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      elevation: 0.0,
      backgroundColor: primaryColorLight,
    ),
  );

  ThemeData dark = ThemeData(
    scaffoldBackgroundColor: greenBackground,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: primaryColorLight,
      onPrimary: whiteColor,
      secondary: greenBackground,
      onSecondary: whiteColor,
      error: Colors.red,
      onError: whiteColor,
      background: greenBackground,
      onBackground: primaryColorLight,
      surface: Colors.deepPurple,
      onSurface: whiteColor,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColorLight,
      elevation: 0.0,
    ),
    iconTheme: const IconThemeData(color: whiteColor),
    textTheme: const TextTheme(
      headline1: TextStyle(fontWeight: FontWeight.bold,fontSize: 32,color: whiteColor),
      subtitle1: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: primaryColorLight),
      subtitle2: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: whiteColor),
      bodyText1: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: greenColor),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: primaryColorLight,
        unselectedItemColor: Colors.grey
    ),
  );
}
