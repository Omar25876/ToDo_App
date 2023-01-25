import 'package:flutter/material.dart';


class MyTheme {
  static const  Color greenColor = const Color.fromRGBO(97, 231, 87, 1.0);
  static const Color greenBackground = const Color.fromRGBO(223, 236, 219, 1.0);
  static const Color primaryColor =  Color.fromRGBO(93, 156, 236, 1.0);
  static const Color primaryColorDark = const Color.fromRGBO(6, 14, 30, 1.0);
  static const Color secondaryColor = const Color.fromRGBO(54, 54, 54, 1.0);
  static const Color secondaryColorDark = const Color.fromRGBO(255, 255, 255, 1.0);


  static ThemeData LightTheme = ThemeData(
    primaryColor: primaryColor,
    accentColor: secondaryColorDark,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      backgroundColor:Color.fromRGBO(93, 156, 236, 1.0),
      elevation: 0.0,
      titleTextStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    ),
    iconTheme: IconThemeData(color: secondaryColorDark),
    textTheme: TextTheme(
      headline1: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 25, color: primaryColor),
      subtitle1: TextStyle(
          fontWeight: FontWeight.w600, fontSize: 20, color: Colors.black),
      subtitle2: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
      bodyText1: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 18, color: Colors.grey),
      bodyText2: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 18, color: primaryColor),
      headline3: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 25, color: greenColor),
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      elevation: 0.0,
      backgroundColor: primaryColor,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      elevation: 0,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey
    ),
  );

  static ThemeData DarkTheme = ThemeData(
    primaryColor: primaryColorDark,
    accentColor: secondaryColorDark,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      backgroundColor:Color.fromRGBO(93, 156, 236, 1.0),
      elevation: 0.0,
      titleTextStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.black),
    ),
    iconTheme: IconThemeData(color: secondaryColorDark),
    textTheme: TextTheme(
      headline1: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 25, color: primaryColor),
      subtitle1: TextStyle(
          fontWeight: FontWeight.w600, fontSize: 20, color: Colors.white),
      subtitle2: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 18, color: primaryColor),
      bodyText1: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 18, color: Colors.grey),
      bodyText2: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 18, color: primaryColor),
      headline3: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 25, color: greenColor),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      elevation: 0.0,
      backgroundColor: primaryColor,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      elevation: 0,
      backgroundColor: primaryColorDark,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: primaryColorDark,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey
    ),
  );




}
