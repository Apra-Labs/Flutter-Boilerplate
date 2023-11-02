import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/themes/color_schemes.dart';

ThemeData getAppTheme(BuildContext context, bool isDarkTheme) {
  if (isDarkTheme) {
    return darkTheme;
  } else {
    return lightTheme;
  }
}

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    textTheme: lightThemeText,
    appBarTheme: const AppBarTheme(
      color: AppColorsPalette.blue,
      iconTheme: IconThemeData(color: AppColorsPalette.dark),
    ),
    colorScheme: lightThemeColors(),
    scaffoldBackgroundColor: AppColorsPalette.light,
    extensions: const <ThemeExtension<dynamic>>[
      AppColors(
          blue: Color.fromRGBO(83, 112, 255, 1),
          dynamicTextColor: Color.fromRGBO(0, 0, 0, 1),
          gray3: Color.fromRGBO(169, 184, 255, 1),
          gray2: Color.fromRGBO(223, 223, 223, 1))
    ]);

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    textTheme: darkThemeText,
    appBarTheme: const AppBarTheme(
      color: AppColorsPalette.danger,
      iconTheme: IconThemeData(color: AppColorsPalette.white),
    ),
    colorScheme: darkThemeColors(),
    scaffoldBackgroundColor: AppColorsPalette.dark,
    extensions: const <ThemeExtension<dynamic>>[
      AppColors(
          blue: Color.fromRGBO(238, 129, 96, 1),
          dynamicTextColor: Color.fromRGBO(255, 255, 255, 1),
          gray3: Color.fromRGBO(77, 99, 211, 1),
          gray2: Color.fromRGBO(112, 112, 112, 1))
    ]);

TextTheme lightThemeText = setTextThemeAndColor(Colors.black);
TextTheme darkThemeText = setTextThemeAndColor(Colors.white);

TextTheme setTextThemeAndColor(Color color) {
  return (TextTheme(
    displayLarge:
        TextStyle(fontSize: 96, fontWeight: FontWeight.w300, color: color),
    displayMedium:
        TextStyle(fontSize: 60, fontWeight: FontWeight.w400, color: color),
    displaySmall:
        TextStyle(fontSize: 48, fontWeight: FontWeight.w400, color: color),
    headlineLarge:
        TextStyle(fontSize: 34, fontWeight: FontWeight.w400, color: color),
    headlineMedium:
        TextStyle(fontSize: 30, fontWeight: FontWeight.w400, color: color),
    headlineSmall:
        TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: color),
    titleLarge:
        TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: color),
    titleMedium:
        TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: color),
    bodyLarge:
        TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: color),
    bodyMedium:
        TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: color),
    bodySmall:
        TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: color),
    labelSmall:
        TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: color),
    labelLarge:
        TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: color),
  ));
}

class FontSize {
  static const double header1 = 24.0;
  static const double header = 20.0;
  static const double miniheader = 18.0;
  static const double large = 22.0;
  static const double extralarge = 30.0;
  static const double medium = 16.0;
  static const double small = 12.0;
  static const double extrasmall = 10.0;
  static const double fab = 9.5;
  static const double normal = 14.0;
}

class BorderRadiusClass {
  static const double button = 30.0;
}

extension ThemeGetter on BuildContext {
  // Usage example: `context.theme`
  ThemeData get theme => Theme.of(this);
}
