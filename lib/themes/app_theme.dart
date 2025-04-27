// Solarized Dark Minimal Theme
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suvankars_dictionary/providers/color_scheme_provider.dart';
import 'package:suvankars_dictionary/providers/theme_provider.dart';

final Color darkThemePink = Colors.pink.shade800;
final Color lightThemePink = Colors.pink.shade500;
final Color darkThemeLime = Colors.lime.shade900;
final Color lightThemeLime = Colors.lime.shade700;
final Color darkThemeOrange = Colors.orange.shade900;
final Color lightThemeOrange = Colors.orange.shade700;

ThemeData appDarkTheme(WidgetRef ref) {
  final colorScheme = ref.watch(colorSchemeProvider);
  Color mainColor;

  switch (colorScheme) {
    case ColorSchemeOption.pink:
      mainColor = darkThemePink;
      break;
    case ColorSchemeOption.lime:
      mainColor = darkThemeLime;
      break;
    case ColorSchemeOption.orange:
      mainColor = darkThemeOrange;
      break;
  }
  return ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.black54,
      selectedItemColor: mainColor,
      unselectedItemColor: Colors.grey,
    ),
    cardTheme: CardTheme(
      color: Colors.grey.shade900,
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
    ),
  );
}

ThemeData appLightTheme(WidgetRef ref) {
  final colorScheme = ref.watch(colorSchemeProvider);
  Color mainColor;

  switch (colorScheme) {
    case ColorSchemeOption.pink:
      mainColor = lightThemePink;
      break;
    case ColorSchemeOption.lime:
      mainColor = lightThemeLime;
      break;
    case ColorSchemeOption.orange:
      mainColor = lightThemeOrange;
      break;
  }

  print("============ color scheme? $colorScheme, $mainColor");

  return ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: mainColor,
      unselectedItemColor: Colors.black54,
    ),
    cardTheme: CardTheme(
      color: Colors.grey[100],
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
    ),
  );
}

Color buttonColor(WidgetRef ref) {
  final colorScheme = ref.watch(colorSchemeProvider);
  final themeData = ref.watch(themeProvider);

  switch (colorScheme) {
    case ColorSchemeOption.pink:
      if (themeData == ThemeMode.dark) {
        return darkThemePink;
      } else {
        return lightThemePink;
      }
    case ColorSchemeOption.lime:
      if (themeData == ThemeMode.dark) {
        return darkThemeLime;
      } else {
        return lightThemeLime;
      }
    case ColorSchemeOption.orange:
      if (themeData == ThemeMode.dark) {
        return darkThemeOrange;
      } else {
        return lightThemeOrange;
      }
  }
}
