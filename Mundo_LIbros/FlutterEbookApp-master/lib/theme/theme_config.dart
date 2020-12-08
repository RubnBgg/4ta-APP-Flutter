import 'package:flutter/material.dart';

class ThemeConfig {
  static Color lightPrimary = Colors.blue[600];
  static Color darkPrimary = Colors.green;
  static Color lightAccent = Colors.brown;
  static Color darkAccent = Colors.black;
  static Color lightBG = Colors.blueAccent[100];
  static Color darkBG = Color(0xff121212);

  static ThemeData lightTheme = ThemeData(
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    accentColor: lightAccent,
    cursorColor: lightAccent,
    scaffoldBackgroundColor: lightBG,
    appBarTheme: AppBarTheme(
      elevation: 0.0,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: darkBG,
    primaryColor: darkPrimary,
    accentColor: darkAccent,
    scaffoldBackgroundColor: darkBG,
    cursorColor: darkAccent,
    appBarTheme: AppBarTheme(
      elevation: 0.0,
    ),
  );
}
