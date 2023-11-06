import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/themes/color_schemes.dart';

/// A customizable text input field with various styling options.
///
/// The `TextInput` widget provides a flexible text input field that can be customized
/// with options such as [labelText], [hintText], [icon], [keyboardType], and [obscureText].
/// You can also specify a custom controller and listen for text changes using [onChanged].

class TextInput extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final IconData? icon;
  final TextInputType keyboardType;
  final bool obscureText;
  final ValueChanged<String>? onChanged;

  /// Creates a `TextInput` widget.
  ///
  /// The [key] is an optional parameter that can be used to identify this widget.
  /// The [controller] is a required TextEditingController to control the input field's text.
  /// The [labelText] is the text that appears as a label for the input field.
  /// The [hintText] is an optional hint text displayed when the field is empty.
  /// The [icon] is an optional icon to display before the input field.
  /// The [keyboardType] is used to specify the type of keyboard to display.
  /// The [obscureText] determines whether the text should be obscured (e.g., for passwords).
  /// The [onChanged] callback is triggered when the text in the field changes.
  const TextInput({
    super.key,
    required this.controller,
    required this.labelText,
    this.hintText = '',
    this.icon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors appColors = Theme.of(context).extension<AppColors>()!;
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChanged,
      cursorColor: appColors.dynamicTextColor,
      style: TextStyle(
        color: appColors.dynamicTextColor,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: appColors.dynamicTextColor),
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: appColors.dynamicTextColor!)),
        icon: icon != null ? Icon(icon) : null,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
