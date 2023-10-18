import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/theme.dart';

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
            color: AppColors.white,
          );
    case ButtonVariant.warning:
    case ButtonVariant.info:
    case ButtonVariant.light:
      return Theme.of(context)
          .textTheme
          .labelLarge!
          .copyWith(color: AppColors.dark2);
    case ButtonVariant.link:
      return Theme.of(context).textTheme.labelLarge!.copyWith(
          color: AppColors.blue,
          backgroundColor: AppColors.transparent,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.blue);
    case ButtonVariant.outlinePrimary:
      return Theme.of(context)
          .textTheme
          .labelLarge!
          .copyWith(color: AppColors.blue);
    case ButtonVariant.outlineSecondary:
      return Theme.of(context)
          .textTheme
          .labelLarge!
          .copyWith(color: AppColors.textNormal);
    case ButtonVariant.outlineSuccess:
      return Theme.of(context)
          .textTheme
          .labelLarge!
          .copyWith(color: AppColors.positive);
    case ButtonVariant.outlineWarning:
      return Theme.of(context)
          .textTheme
          .labelLarge!
          .copyWith(color: AppColors.warning);
    case ButtonVariant.outlineDanger:
      return Theme.of(context)
          .textTheme
          .labelLarge!
          .copyWith(color: AppColors.danger);
    case ButtonVariant.outlineInfo:
      return Theme.of(context)
          .textTheme
          .labelLarge!
          .copyWith(color: AppColors.gray3);
    case ButtonVariant.outlineLight:
      return Theme.of(context)
          .textTheme
          .labelLarge!
          .copyWith(color: AppColors.light);
    case ButtonVariant.outlineDark:
      return Theme.of(context)
          .textTheme
          .labelLarge!
          .copyWith(color: AppColors.dark2);
  }
}

// Function to get the background color based on the variant
Color getButtonBackgroundColor(ButtonVariant variant, BuildContext context) {
  switch (variant) {
    case ButtonVariant.primary:
      return AppColors.blue;
    case ButtonVariant.secondary:
      return AppColors.textNormal;
    case ButtonVariant.success:
      return AppColors.positive;
    case ButtonVariant.danger:
      return AppColors.danger;
    case ButtonVariant.warning:
      return AppColors.warning;
    case ButtonVariant.dark:
      return AppColors.dark;
    case ButtonVariant.info:
      return AppColors.gray3;
    case ButtonVariant.light:
      return AppColors.light;
    case ButtonVariant.link:
    case ButtonVariant.outlinePrimary:
    case ButtonVariant.outlineSecondary:
    case ButtonVariant.outlineSuccess:
    case ButtonVariant.outlineWarning:
    case ButtonVariant.outlineDanger:
    case ButtonVariant.outlineInfo:
    case ButtonVariant.outlineLight:
    case ButtonVariant.outlineDark:
      return Colors.transparent;
  }
}

// Function to get the border color based on the variant
Color getButtonBorderColor(ButtonVariant variant, BuildContext context) {
  switch (variant) {
    case ButtonVariant.outlinePrimary:
      return AppColors.blue;
    case ButtonVariant.outlineSecondary:
      return AppColors.textNormal;
    case ButtonVariant.outlineSuccess:
      return AppColors.positive;
    case ButtonVariant.outlineDanger:
      return AppColors.danger;
    case ButtonVariant.outlineWarning:
      return AppColors.warning;
    case ButtonVariant.outlineDark:
      return AppColors.dark;
    case ButtonVariant.outlineInfo:
      return AppColors.gray3;
    case ButtonVariant.outlineLight:
      return AppColors.light;
    case ButtonVariant.link:
    case ButtonVariant.primary:
    case ButtonVariant.secondary:
    case ButtonVariant.success:
    case ButtonVariant.warning:
    case ButtonVariant.danger:
    case ButtonVariant.info:
    case ButtonVariant.light:
    case ButtonVariant.dark:
      return Colors.transparent;
  }
}
