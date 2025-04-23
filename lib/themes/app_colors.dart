// Solarized Dark Minimal Theme
import 'package:flutter/material.dart';

final Color darkThemePink = Colors.pink.shade800;
final Color lightThemePink = Colors.pink.shade500;

final ThemeData appDarkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.black54,
        selectedItemColor: darkThemePink,
        unselectedItemColor: Colors.grey
    ),
);

final ThemeData appLightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: lightThemePink,
    unselectedItemColor: Colors.black54
  ),
);
