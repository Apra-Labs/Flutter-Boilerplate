import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/themes/variants.dart';

class CheckboxButton extends StatelessWidget {
  final Variant variant;
  final bool value;
  final ValueChanged<bool?>? onChanged;
  final String label;

  const CheckboxButton({
    super.key,
    required this.value,
    required this.label,
    this.variant = Variant.primary,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    VariantStyle style = getVariantStyle(variant);
    return Row(
      children: [
        Checkbox(
            value: value,
            onChanged: onChanged,
            activeColor: style.backgroundColor),
        Text(label),
      ],
    );
  }
}
