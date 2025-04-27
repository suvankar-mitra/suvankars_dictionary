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
final Color darkThemeBlue = Colors.blue.shade900;
final Color lightThemeBlue = Colors.blue.shade500;
final Color darkThemeRed = Colors.red.shade900;
final Color lightThemeRed = Colors.red.shade500;

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
    case ColorSchemeOption.blue:
      mainColor = darkThemeBlue;
      break;
    case ColorSchemeOption.red:
      mainColor = darkThemeRed;
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
    case ColorSchemeOption.blue:
      mainColor = lightThemeBlue;
      break;
    case ColorSchemeOption.red:
      mainColor = lightThemeRed;
      break;
  }
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

  switch (colorScheme) {
    case ColorSchemeOption.pink:
      return getPinkColor(ref);
    case ColorSchemeOption.lime:
      return getLimeColor(ref);
    case ColorSchemeOption.orange:
      return getOrangeColor(ref);
    case ColorSchemeOption.blue:
      return getBlueColor(ref);
    case ColorSchemeOption.red:
      return getRedColor(ref);
  }
}

Color getPinkColor(WidgetRef ref) {
  final themeData = ref.watch(themeProvider);
  if (themeData == ThemeMode.dark) {
    return darkThemePink;
  } else {
    return lightThemePink;
  }
}

Color getLimeColor(WidgetRef ref) {
  final themeData = ref.watch(themeProvider);
  if (themeData == ThemeMode.dark) {
    return darkThemeLime;
  } else {
    return lightThemeLime;
  }
}

Color getOrangeColor(WidgetRef ref) {
  final themeData = ref.watch(themeProvider);
  if (themeData == ThemeMode.dark) {
    return darkThemeOrange;
  } else {
    return lightThemeOrange;
  }
}

Color getBlueColor(WidgetRef ref) {
  final themeData = ref.watch(themeProvider);
  if (themeData == ThemeMode.dark) {
    return darkThemeBlue;
  } else {
    return lightThemeBlue;
  }
}

Color getRedColor(WidgetRef ref) {
  final themeData = ref.watch(themeProvider);
  if (themeData == ThemeMode.dark) {
    return darkThemeRed;
  } else {
    return lightThemeRed;
  }
}
