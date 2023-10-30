import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/color_schemes.dart';
import 'package:flutter_boilerplate/theme.dart';

enum Variant {
  primary,
  secondary,
  success,
  danger,
  warning,
  info,
  light,
  dark,
}

// Function to get the appropriate style based on the variant
TextStyle getStyle(Variant variant) {
  switch (variant) {
    case Variant.primary:
    case Variant.secondary:
    case Variant.success:
    case Variant.danger:
    case Variant.warning:
    case Variant.info:
    case Variant.light:
    case Variant.dark:
      return const TextStyle(
        color: AppColorsPalette.white,
        fontSize: FontSize.medium,
      );
  }
}

// Function to get the background color based on the variant
Color getBackgroundColor(Variant variant) {
  switch (variant) {
    case Variant.primary:
      return AppColorsPalette.blue;
    case Variant.secondary:
      return AppColorsPalette.textNormal;
    case Variant.success:
      return AppColorsPalette.positive;
    case Variant.danger:
      return AppColorsPalette.danger;
    case Variant.warning:
      return AppColorsPalette.warning;
    case Variant.dark:
      return AppColorsPalette.dark;
    case Variant.info:
      return AppColorsPalette.gray3;
    case Variant.light:
      return AppColorsPalette.light;
  }
}
