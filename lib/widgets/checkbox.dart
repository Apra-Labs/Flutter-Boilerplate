import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/themes/variants.dart';

/// A checkbox button widget with customizable appearance.
///
/// The `CheckboxButton` widget provides a checkbox button with customizable appearance,
/// allowing you to set the checkbox [value], a [label] for the checkbox, and the [onChanged] callback.
/// Additionally, you can specify a visual [variant] for the checkbox.
class CheckboxButton extends StatelessWidget {
  /// The visual appearance of the checkbox, defined by a `Variant`.
  final Variant variant;

  /// The current value of the checkbox, whether it is checked or unchecked.
  final bool value;

  /// A callback function that is invoked when the value of the checkbox changes.
  final ValueChanged<bool?>? onChanged;

  /// The label displayed next to the checkbox.
  final String label;

  /// Creates a `CheckboxButton` widget.
  ///
  /// The [value] parameter specifies the current value of the checkbox (true for checked, false for unchecked).
  /// The [label] parameter is used to display text next to the checkbox.
  /// The optional [variant] parameter defines the visual appearance of the checkbox and is based on a `Variant`.
  /// The [onChanged] callback is invoked when the checkbox value changes.
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
