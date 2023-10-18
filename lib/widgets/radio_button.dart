import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/alert_variants.dart';

class RadioButton<T> extends StatelessWidget {
  final Variant variant;
  final T value;
  final T groupValue;
  final ValueChanged<T?>? onChanged;
  final String label;

  const RadioButton({
    super.key,
    required this.value,
    required this.groupValue,
    this.onChanged,
    this.variant = Variant.primary,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Radio<T>(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          activeColor: getBackgroundColor(variant),
        ),
        Text(label),
      ],
    );
  }
}
