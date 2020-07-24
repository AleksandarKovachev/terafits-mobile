import 'package:flutter/material.dart';

enum AppTheme { DarkTheme, LightTheme }

final appThemeData = {
  AppTheme.DarkTheme: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blueGrey,
    accentColor: Colors.blue,
    primaryColorDark: Colors.black,
    indicatorColor: Colors.white,
    appBarTheme: AppBarTheme(
      brightness: Brightness.dark,
      color: Colors.transparent,
      elevation: 0,
    ),
  ),
  AppTheme.LightTheme: ThemeData(
    brightness: Brightness.light,
    accentColor: Colors.blue,
    appBarTheme: AppBarTheme(
      brightness: Brightness.light,
      color: Colors.transparent,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      elevation: 0,
    ),
  ),
};
