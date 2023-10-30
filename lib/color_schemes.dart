import 'package:flutter/material.dart';

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
    surface: Color.fromARGB(255, 203, 237, 191),
    onSurface: Color.fromARGB(255, 3, 2, 2),
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
    surface: Color.fromARGB(255, 91, 223, 46),
    onSurface: Color.fromARGB(255, 228, 233, 225),
  );
}

class AppColors extends ThemeExtension<AppColors> {
  //extension should only contains colors/names that are not in default colorschemes.
  final Color? blue;
  final Color? dark;
  final Color? gray3;
  final Color? danger;
  final Color? textNormal;
  final Color? positive;
  final Color? gray;
  final Color? gray2;
  final Color? warning;

  const AppColors({
    this.blue,
    this.dark,
    this.gray3,
    this.danger,
    this.textNormal,
    this.positive,
    this.gray,
    this.gray2,
    this.warning,
  });

  @override
  ThemeExtension<AppColors> copyWith(
      {Color? blue,
      Color? dark,
      Color? gray3,
      Color? danger,
      Color? textNormal,
      Color? positive,
      Color? gray,
      Color? gray2,
      Color? warning}) {
    return AppColors(
        blue: blue ?? this.blue,
        dark: dark ?? this.dark,
        gray3: gray3 ?? this.gray3,
        danger: danger ?? this.danger,
        textNormal: textNormal ?? this.textNormal,
        positive: positive ?? this.positive,
        gray: gray ?? this.gray,
        gray2: gray2 ?? this.gray2,
        warning: warning ?? this.warning);
  }

  @override
  ThemeExtension<AppColors> lerp(
      covariant ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
        blue: Color.lerp(blue, other.blue, t),
        dark: Color.lerp(dark, other.dark, t),
        gray3: Color.lerp(gray3, other.gray3, t),
        danger: Color.lerp(danger, other.danger, t),
        textNormal: Color.lerp(textNormal, other.textNormal, t),
        positive: Color.lerp(positive, other.positive, t),
        gray: Color.lerp(gray, other.gray, t),
        gray2: Color.lerp(gray2, other.gray2, t),
        warning: Color.lerp(warning, other.warning, t));
  }
}

class AppColorsPalette {
  static const Color primary = Color.fromRGBO(148, 186, 51, 1);
  static const Color secondary = Color.fromRGBO(65, 65, 67, 1);
  static const Color danger = Color.fromRGBO(241, 90, 90, 1);
  static const Color textNormal = Color.fromRGBO(134, 135, 136, 1);
  static const Color light = Color.fromRGBO(248, 248, 248, 1);
  static const Color dark = Color.fromRGBO(0, 0, 0, 1);
  static const Color dark2 = Color.fromARGB(211, 0, 0, 0);
  static const Color positive = Color.fromRGBO(62, 175, 86, 1);
  static Color secondary2 = Colors.red.shade300;
  static const Color gray = Color.fromRGBO(240, 244, 250, 1);
  static const Color gray2 = Color.fromRGBO(223, 223, 223, 1);
  static const Color actionbar = Color.fromRGBO(230, 230, 230, 1);
  static const Color gray3 = Color.fromRGBO(169, 184, 255, 1);
  static const Color blue = Color.fromRGBO(83, 112, 255, 1);
  static const Color warning = Colors.amber;
  static const Color transparent = Colors.transparent;
  static const Color white = Colors.white;
  static const Color pink = Color(0xFFffb7c3);
  static const Color pink2 = Color(0xFFeec6ca);
  static const Color orange = Colors.deepOrange;
}
