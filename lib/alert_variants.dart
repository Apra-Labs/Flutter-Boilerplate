import 'package:flutter/material.dart';
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
        color: AppColors.white,
        fontSize: FontSize.medium,
      );
  }
}

// Function to get the background color based on the variant
Color getBackgroundColor(Variant variant) {
  switch (variant) {
    case Variant.primary:
      return AppColors.blue;
    case Variant.secondary:
      return AppColors.textNormal;
    case Variant.success:
      return AppColors.positive;
    case Variant.danger:
      return AppColors.danger;
    case Variant.warning:
      return AppColors.warning;
    case Variant.dark:
      return AppColors.dark;
    case Variant.info:
      return AppColors.gray3;
    case Variant.light:
      return AppColors.light;
  }
}
