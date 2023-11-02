import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/themes/color_schemes.dart';
import 'package:flutter_boilerplate/themes/theme.dart';

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

class VariantStyle {
  final Color backgroundColor;
  final TextStyle textStyle;
  const VariantStyle({required this.backgroundColor, required this.textStyle});
}

final variantStyles = {
  Variant.primary: {
    "backgroundColor": AppColorsPalette.blue,
    "textColor": AppColorsPalette.white
  },
  Variant.secondary: {
    "backgroundColor": AppColorsPalette.textNormal,
    "textColor": AppColorsPalette.white
  },
  Variant.success: {
    "backgroundColor": AppColorsPalette.positive,
    "textColor": AppColorsPalette.white
  },
  Variant.danger: {
    "backgroundColor": AppColorsPalette.danger,
    "textColor": AppColorsPalette.white
  },
  Variant.dark: {
    "backgroundColor": AppColorsPalette.dark,
    "textColor": AppColorsPalette.white
  },
  Variant.warning: {
    "backgroundColor": AppColorsPalette.warning,
    "textColor": AppColorsPalette.dark2
  },
  Variant.info: {
    "backgroundColor": AppColorsPalette.gray3,
    "textColor": AppColorsPalette.dark2
  },
  Variant.light: {
    "backgroundColor": AppColorsPalette.light,
    "textColor": AppColorsPalette.dark2
  },
};

VariantStyle getVariantStyle(Variant variant) {
  final style = variantStyles[variant];
  if (style != null) {
    return VariantStyle(
        backgroundColor: style["backgroundColor"] as Color,
        textStyle: TextStyle(
          color: style['textColor'] as Color,
          fontSize: FontSize.medium,
        ));
  } else {
    return const VariantStyle(
      backgroundColor: AppColorsPalette.transparent,
      textStyle:
          TextStyle(color: AppColorsPalette.dark2, fontSize: FontSize.medium),
    );
  }
}
