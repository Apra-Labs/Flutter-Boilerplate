import 'package:flutter/material.dart';

ThemeData getAppTheme(BuildContext context, bool isDarkTheme) {
  if (isDarkTheme) {
    return darkTheme;
  } else {
    return lightTheme;
  }
}

extension ThemeGetter on BuildContext {
  // Usage example: `context.theme`
  ThemeData get theme => Theme.of(this);
}

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    textTheme: lightThemeText,
    appBarTheme: const AppBarTheme(
      color: AppColors.blue,
      iconTheme: IconThemeData(color: AppColors.white),
    ),
    colorScheme: lightThemeColors(),
    // ColorScheme.fromSeed(seedColor: AppColors.blue),
    scaffoldBackgroundColor: AppColors.light);

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    textTheme: darkThemeText,
    appBarTheme: const AppBarTheme(
      color: AppColors.danger,
      iconTheme: IconThemeData(color: AppColors.white),
    ),
    colorScheme: darkThemeColors(),
    //  ColorScheme.fromSeed(seedColor: AppColors.danger)
    //     .copyWith(brightness: Brightness.dark),
    scaffoldBackgroundColor: AppColors.dark);

TextTheme lightThemeText = const TextTheme(
  //class should inherit color from base class
  displayLarge:
      TextStyle(fontSize: 96, fontWeight: FontWeight.w300, color: Colors.black),
  displayMedium:
      TextStyle(fontSize: 60, fontWeight: FontWeight.w400, color: Colors.black),
  displaySmall:
      TextStyle(fontSize: 48, fontWeight: FontWeight.w400, color: Colors.black),
  headlineLarge:
      TextStyle(fontSize: 34, fontWeight: FontWeight.w400, color: Colors.black),
  headlineMedium:
      TextStyle(fontSize: 30, fontWeight: FontWeight.w400, color: Colors.black),
  headlineSmall:
      TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: Colors.black),
  titleLarge:
      TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: Colors.black),
  titleMedium:
      TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
  bodyLarge: TextStyle(
      fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black87),
  bodyMedium: TextStyle(
      fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black87),
  bodySmall: TextStyle(
      fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black54),
  labelSmall:
      TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.black),
  labelLarge:
      TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black),
);

TextTheme darkThemeText = const TextTheme(
  displayLarge:
      TextStyle(fontSize: 96, fontWeight: FontWeight.w300, color: Colors.white),
  displayMedium:
      TextStyle(fontSize: 60, fontWeight: FontWeight.w400, color: Colors.white),
  displaySmall:
      TextStyle(fontSize: 48, fontWeight: FontWeight.w400, color: Colors.white),
  headlineLarge:
      TextStyle(fontSize: 34, fontWeight: FontWeight.w400, color: Colors.white),
  headlineMedium:
      TextStyle(fontSize: 30, fontWeight: FontWeight.w400, color: Colors.white),
  headlineSmall:
      TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: Colors.white),
  titleLarge:
      TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: Colors.white),
  titleMedium:
      TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
  bodyLarge:
      TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),
  bodyMedium:
      TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
  bodySmall: TextStyle(
      fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white54),
  labelSmall: TextStyle(
      fontSize: 10, fontWeight: FontWeight.w400, color: Colors.white54),
  labelLarge:
      TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white),
);

class AppColors {
  static const Color primary = Color.fromRGBO(148, 186, 51, 1);
  static const Color secondary = Color.fromRGBO(65, 65, 67, 1);
  static const Color danger = Color.fromRGBO(241, 90, 90, 1);
  static const Color textNormal = Color.fromRGBO(134, 135, 136, 1);
  static const Color light = Color.fromRGBO(248, 248, 248, 1);
  static const Color dark = Color.fromRGBO(0, 0, 0, 1);
  static const Color dark2 = Color.fromARGB(211, 0, 0, 0);
  static const Color positive = Color.fromRGBO(62, 175, 86, 1);
  static const Color secondary2 = Color.fromRGBO(226, 77, 71, 1);
  static const Color gray = Color.fromRGBO(240, 244, 250, 1);
  static const Color gray2 = Color.fromRGBO(223, 223, 223, 1);
  static const Color actionbar = Color.fromRGBO(230, 230, 230, 1);
  static const Color gray3 = Color.fromRGBO(169, 184, 255, 1);
  static const Color blue = Color.fromRGBO(83, 112, 255, 1);
  static const Color warning = Colors.amber;
  static const Color transparent = Colors.transparent;
  static const Color white = Colors.white;
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

ColorScheme lightThemeColors() {
  return const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF202020),
    onPrimary: Color(0xFF505050),
    secondary: Color(0xFFBBBBBB),
    onSecondary: Color(0xFFEAEAEA),
    error: Color(0xFFF32424),
    onError: Color(0xFFF32424),
    background: Color(0xFFF1F2F3),
    onBackground: Color(0xFFFFFFFF),
    surface: Color(0xFF54B435),
    onSurface: Color(0xFF54B435),
  );
}

ColorScheme darkThemeColors() {
  return const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFF1F2F3),
    onPrimary: Color(0xFFFFFFFF),
    secondary: Color(0xFFBBBBBB),
    onSecondary: Color(0xFFEAEAEA),
    error: Color(0xFFF32424),
    onError: Color(0xFFF32424),
    background: Color(0xFF202020),
    onBackground: Color(0xFF505050),
    surface: Color(0xFF54B435),
    onSurface: Color(0xFF54B435),
  );
}

/*
TextStyle _baseTextStyle({
  double fontSize,
  FontWeight fontWeight,
  Color color,
}) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

TextTheme _createTextTheme({
  double displayLargeFontSize,
  double displayMediumFontSize,
  double displaySmallFontSize,
  double headlineLargeFontSize,
  double headlineMediumFontSize,
  double headlineSmallFontSize,
  double titleLargeFontSize,
  double titleMediumFontSize,
  double bodyLargeFontSize,
  double bodyMediumFontSize,
  double bodySmallFontSize,
  double labelLargeFontSize,
  FontWeight commonFontWeight,
  Color commonColor,
}) {
  return TextTheme(
    displayLarge: _baseTextStyle(
      fontSize: displayLargeFontSize,
      fontWeight: FontWeight.w300,
      color: commonColor,
    ),
    displayMedium: _baseTextStyle(
      fontSize: displayMediumFontSize,
      fontWeight: FontWeight.w400,
      color: commonColor,
    ),
    displaySmall: _baseTextStyle(
      fontSize: displaySmallFontSize,
      fontWeight: FontWeight.w400,
      color: commonColor,
    ),
    headlineLarge: _baseTextStyle(
      fontSize: headlineLargeFontSize,
      fontWeight: FontWeight.w400,
      color: commonColor,
    ),
    headlineMedium: _baseTextStyle(
      fontSize: headlineMediumFontSize,
      fontWeight: FontWeight.w400,
      color: commonColor,
    ),
    headlineSmall: _baseTextStyle(
      fontSize: headlineSmallFontSize,
      fontWeight: FontWeight.w400,
      color: commonColor,
    ),
    titleLarge: _baseTextStyle(
      fontSize: titleLargeFontSize,
      fontWeight: FontWeight.w500,
      color: commonColor,
    ),
    titleMedium: _baseTextStyle(
      fontSize: titleMediumFontSize,
      fontWeight: FontWeight.w500,
      color: commonColor,
    ),
    bodyLarge: _baseTextStyle(
      fontSize: bodyLargeFontSize,
      fontWeight: FontWeight.w400,
      color: commonColor,
    ),
    bodyMedium: _baseTextStyle(
      fontSize: bodyMediumFontSize,
      fontWeight: FontWeight.w400,
      color: commonColor,
    ),
    bodySmall: _baseTextStyle(
      fontSize: bodySmallFontSize,
      fontWeight: FontWeight.w400,
      color: commonColor,
    ),
    labelLarge: _baseTextStyle(
      fontSize: labelLargeFontSize,
      fontWeight: FontWeight.w400,
      color: commonColor,
    ),
  );
}

TextTheme lightThemeText = _createTextTheme(
  displayLargeFontSize: 96,
  displayMediumFontSize: 60,
  displaySmallFontSize: 48,
  headlineLargeFontSize: 34,
  headlineMediumFontSize: 30,
  headlineSmallFontSize: 24,
  titleLargeFontSize: 20,
  titleMediumFontSize: 20, // Add size for titleMedium
  bodyLargeFontSize: 20,
  bodyMediumFontSize: 16,
  bodySmallFontSize: 12,
  labelLargeFontSize: 20,
  commonFontWeight: FontWeight.w400,
  commonColor: Colors.black87,
);

TextTheme darkThemeText = _createTextTheme(
  displayLargeFontSize: 96,
  displayMediumFontSize: 60,
  displaySmallFontSize: 48,
  headlineLargeFontSize: 34,
  headlineMediumFontSize: 30,
  headlineSmallFontSize: 24,
  titleLargeFontSize: 22, // Adjusted size for dark theme
  titleMediumFontSize: 20,
  bodyLargeFontSize: 20,
  bodyMediumFontSize: 16,
  bodySmallFontSize: 12,
  labelLargeFontSize: 20,
  commonFontWeight: FontWeight.w400,
  commonColor: Colors.white,
);


*/