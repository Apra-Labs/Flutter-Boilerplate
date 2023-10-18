import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/alert_variants.dart';

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
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: getBackgroundColor(variant),
        ),
        Text(label),
      ],
    );
  }
}
