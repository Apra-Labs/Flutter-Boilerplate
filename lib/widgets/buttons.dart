import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/widgets/theme.dart';

enum ButtonType {
  button, // looks like button
  outline, // outline color, no fill
  link // looks like link
}

// ignore: must_be_immutable
class Button extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool disabled;
  final ButtonType type;
  Color? color;
  Color? textColor;
  Color? borderColor;
  double? elevation;
  double? borderRadius;
  EdgeInsetsGeometry padding;
  TextStyle style;
  Icon? leadingIcon;
  Icon? trailingIcon;
  Image? trailingImage;
  Image? leadingImage;
  MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;

  Button(
      {Key? key,
      required this.label,
      required this.onPressed,
      this.color,
      this.disabled = false,
      this.textColor,
      this.elevation,
      this.borderRadius,
      this.padding = const EdgeInsets.all(20),
      this.style = const TextStyle(fontWeight: FontWeight.bold),
      this.leadingIcon,
      this.borderColor,
      this.leadingImage,
      this.mainAxisAlignment = MainAxisAlignment.spaceEvenly,
      this.mainAxisSize = MainAxisSize.max,
      this.type = ButtonType.button})
      : super(key: key) {
    if (type == ButtonType.button) {
      borderColor = borderColor ?? Colors.transparent;
    }
    if (type == ButtonType.outline) {
      color = color ?? AppColors.light;
      textColor = textColor ?? AppColors.dark;
    } else if (type == ButtonType.link) {
      color = color ?? AppColors.light;
      textColor = textColor ?? AppColors.secondary;
      elevation = elevation ?? 0;
      borderColor = borderColor ?? AppColors.light;
    }

    if (color == AppColors.light) {
      textColor = textColor ?? AppColors.dark;
      elevation = elevation ?? 2;
    }

    color ??= AppColors.light;
    elevation ??= 3;
    textColor ??= AppColors.dark;
    borderColor ??= AppColors.secondary;
    borderRadius ??= 30.0;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: textColor,
        backgroundColor: color,
        elevation: elevation,
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
          side: BorderSide(color: borderColor!),
        ),
      ),
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: [
          if (leadingIcon != null) Flexible(child: leadingIcon!),
          if (leadingImage != null) Flexible(child: leadingImage!),
          Text(
            label,
            style: style,
          ),
          if (trailingIcon != null) Flexible(child: trailingIcon!),
          if (trailingImage != null) Flexible(child: trailingImage!),
        ],
      ),
    );
  }
}
