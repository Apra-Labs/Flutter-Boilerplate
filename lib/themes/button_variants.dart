import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/themes/color_schemes.dart';

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

class ButtonVariantStyle {
  final Color borderColor;
  final Color backgroundColor;
  final TextStyle textStyle;
  const ButtonVariantStyle(
      {required this.backgroundColor,
      required this.borderColor,
      required this.textStyle});
}

final buttonVariantStyles = {
  ButtonVariant.primary: {
    "backgroundColor": AppColorsPalette.blue,
    "borderColor": AppColorsPalette.transparent,
    "textColor": AppColorsPalette.white
  },
  ButtonVariant.secondary: {
    "backgroundColor": AppColorsPalette.textNormal,
    "borderColor": AppColorsPalette.transparent,
    "textColor": AppColorsPalette.white,
  },
  ButtonVariant.success: {
    "backgroundColor": AppColorsPalette.positive,
    "borderColor": AppColorsPalette.transparent,
    "textColor": AppColorsPalette.white,
  },
  ButtonVariant.danger: {
    "backgroundColor": AppColorsPalette.danger,
    "borderColor": AppColorsPalette.transparent,
    "textColor": AppColorsPalette.white,
  },
  ButtonVariant.dark: {
    "backgroundColor": AppColorsPalette.dark,
    "borderColor": AppColorsPalette.transparent,
    "textColor": AppColorsPalette.white,
  },
  ButtonVariant.warning: {
    "backgroundColor": AppColorsPalette.warning,
    "borderColor": AppColorsPalette.transparent,
    "textColor": AppColorsPalette.dark2,
  },
  ButtonVariant.info: {
    "backgroundColor": AppColorsPalette.gray3,
    "borderColor": AppColorsPalette.transparent,
    "textColor": AppColorsPalette.dark2,
  },
  ButtonVariant.light: {
    "backgroundColor": AppColorsPalette.light,
    "borderColor": AppColorsPalette.transparent,
    "textColor": AppColorsPalette.dark2,
  },
  ButtonVariant.link: {
    "backgroundColor": AppColorsPalette.transparent,
    "borderColor": AppColorsPalette.transparent,
    "textColor": AppColorsPalette.blue,
  },
  ButtonVariant.outlinePrimary: {
    "backgroundColor": AppColorsPalette.transparent,
    "borderColor": AppColorsPalette.blue,
    "textColor": AppColorsPalette.blue
  },
  ButtonVariant.outlineSecondary: {
    "backgroundColor": AppColorsPalette.transparent,
    "borderColor": AppColorsPalette.textNormal,
    "textColor": AppColorsPalette.textNormal
  },
  ButtonVariant.outlineSuccess: {
    "backgroundColor": AppColorsPalette.transparent,
    "borderColor": AppColorsPalette.positive,
    "textColor": AppColorsPalette.positive
  },
  ButtonVariant.outlineLight: {
    "backgroundColor": AppColorsPalette.transparent,
    "borderColor": AppColorsPalette.light,
    "textColor": AppColorsPalette.light
  },
  ButtonVariant.outlineWarning: {
    "backgroundColor": AppColorsPalette.transparent,
    "borderColor": AppColorsPalette.warning,
    "textColor": AppColorsPalette.warning
  },
  ButtonVariant.outlineDanger: {
    "backgroundColor": AppColorsPalette.transparent,
    "borderColor": AppColorsPalette.danger,
    "textColor": AppColorsPalette.danger
  },
  ButtonVariant.outlineInfo: {
    "backgroundColor": AppColorsPalette.transparent,
    "borderColor": AppColorsPalette.gray3,
    "textColor": AppColorsPalette.gray3
  },
  ButtonVariant.outlineDark: {
    "backgroundColor": AppColorsPalette.transparent,
    "borderColor": AppColorsPalette.dark,
    "textColor": AppColorsPalette.dark2
  }
};

/// This function returns the buttons variant style.
ButtonVariantStyle getButtonVariantStyle(
    ButtonVariant variant, BuildContext context) {
  final style = buttonVariantStyles[variant];
  if (style != null && variant == ButtonVariant.link) {
    return ButtonVariantStyle(
        backgroundColor: style["backgroundColor"] as Color,
        borderColor: style["borderColor"] as Color,
        textStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
            color: style["textColor"] as Color,
            backgroundColor: AppColorsPalette.transparent,
            decoration: TextDecoration.underline,
            decorationColor: AppColorsPalette.blue));
  } else if (style != null) {
    return ButtonVariantStyle(
      backgroundColor: style["backgroundColor"] as Color,
      borderColor: style["borderColor"] as Color,
      textStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
            color: style["textColor"] as Color,
          ),
    );
  } else {
    return const ButtonVariantStyle(
      backgroundColor: AppColorsPalette.transparent,
      borderColor: AppColorsPalette.transparent,
      textStyle: TextStyle(color: AppColorsPalette.dark2),
    );
  }
}
