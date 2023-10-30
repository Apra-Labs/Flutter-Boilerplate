import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/color_schemes.dart';

class TextInput extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final IconData? icon;
  final TextInputType keyboardType;
  final bool obscureText;
  final ValueChanged<String>? onChanged;

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
      cursorColor: appColors.dark,
      style: TextStyle(
        color: appColors.dark,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: appColors.dark),
        hintText: hintText,
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: appColors.dark!)),
        icon: icon != null ? Icon(icon) : null,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
