import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/color_schemes.dart';

// Enum to represent different button variants
enum ButtonVariant {
  primary,
  secondary,
  success,
  danger,
  warning,
  info,
  light,
  dark,
  link,
  outlinePrimary,
  outlineSecondary,
  outlineSuccess,
  outlineWarning,
  outlineDanger,
  outlineInfo,
  outlineLight,
  outlineDark
}

// Function to get the appropriate style based on the variant
TextStyle getButtonStyle(ButtonVariant variant, BuildContext context) {
  switch (variant) {
    case ButtonVariant.primary:
    case ButtonVariant.secondary:
    case ButtonVariant.success:
    case ButtonVariant.danger:
    case ButtonVariant.dark:
      return Theme.of(context).textTheme.labelLarge!.copyWith(
            color: AppColorsPalette.white,
          );
    case ButtonVariant.warning:
    case ButtonVariant.info:
    case ButtonVariant.light:
      return Theme.of(context)
          .textTheme
          .labelLarge!
          .copyWith(color: AppColorsPalette.dark2);
    case ButtonVariant.link:
      return Theme.of(context).textTheme.labelLarge!.copyWith(
          color: AppColorsPalette.blue,
          backgroundColor: AppColorsPalette.transparent,
          decoration: TextDecoration.underline,
          decorationColor: AppColorsPalette.blue);
    case ButtonVariant.outlinePrimary:
      return Theme.of(context)
          .textTheme
          .labelLarge!
          .copyWith(color: AppColorsPalette.blue);
    case ButtonVariant.outlineSecondary:
      return Theme.of(context)
          .textTheme
          .labelLarge!
          .copyWith(color: AppColorsPalette.textNormal);
    case ButtonVariant.outlineSuccess:
      return Theme.of(context)
          .textTheme
          .labelLarge!
          .copyWith(color: AppColorsPalette.positive);
    case ButtonVariant.outlineWarning:
      return Theme.of(context)
          .textTheme
          .labelLarge!
          .copyWith(color: AppColorsPalette.warning);
    case ButtonVariant.outlineDanger:
      return Theme.of(context)
          .textTheme
          .labelLarge!
          .copyWith(color: AppColorsPalette.danger);
    case ButtonVariant.outlineInfo:
      return Theme.of(context)
          .textTheme
          .labelLarge!
          .copyWith(color: AppColorsPalette.gray3);
    case ButtonVariant.outlineLight:
      return Theme.of(context)
          .textTheme
          .labelLarge!
          .copyWith(color: AppColorsPalette.light);
    case ButtonVariant.outlineDark:
      return Theme.of(context)
          .textTheme
          .labelLarge!
          .copyWith(color: AppColorsPalette.dark2);
  }
}

// Function to get the background color based on the variant
Color getButtonBackgroundColor(ButtonVariant variant, BuildContext context) {
  switch (variant) {
    case ButtonVariant.primary:
      return AppColorsPalette.blue;
    case ButtonVariant.secondary:
      return AppColorsPalette.textNormal;
    case ButtonVariant.success:
      return AppColorsPalette.positive;
    case ButtonVariant.danger:
      return AppColorsPalette.danger;
    case ButtonVariant.warning:
      return AppColorsPalette.warning;
    case ButtonVariant.dark:
      return AppColorsPalette.dark;
    case ButtonVariant.info:
      return AppColorsPalette.gray3;
    case ButtonVariant.light:
      return AppColorsPalette.light;
    case ButtonVariant.link:
    case ButtonVariant.outlinePrimary:
    case ButtonVariant.outlineSecondary:
    case ButtonVariant.outlineSuccess:
    case ButtonVariant.outlineWarning:
    case ButtonVariant.outlineDanger:
    case ButtonVariant.outlineInfo:
    case ButtonVariant.outlineLight:
    case ButtonVariant.outlineDark:
      return AppColorsPalette.transparent;
  }
}

// Function to get the border color based on the variant
Color getButtonBorderColor(ButtonVariant variant, BuildContext context) {
  switch (variant) {
    case ButtonVariant.outlinePrimary:
      return AppColorsPalette.blue;
    case ButtonVariant.outlineSecondary:
      return AppColorsPalette.textNormal;
    case ButtonVariant.outlineSuccess:
      return AppColorsPalette.positive;
    case ButtonVariant.outlineDanger:
      return AppColorsPalette.danger;
    case ButtonVariant.outlineWarning:
      return AppColorsPalette.warning;
    case ButtonVariant.outlineDark:
      return AppColorsPalette.dark;
    case ButtonVariant.outlineInfo:
      return AppColorsPalette.gray3;
    case ButtonVariant.outlineLight:
      return AppColorsPalette.light;
    case ButtonVariant.link:
    case ButtonVariant.primary:
    case ButtonVariant.secondary:
    case ButtonVariant.success:
    case ButtonVariant.warning:
    case ButtonVariant.danger:
    case ButtonVariant.info:
    case ButtonVariant.light:
    case ButtonVariant.dark:
      return AppColorsPalette.transparent;
  }
}
