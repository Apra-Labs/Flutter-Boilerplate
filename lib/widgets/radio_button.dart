import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/themes/variants.dart';

/// A custom radio button widget with styling options.
///
/// The `RadioButton` widget allows you to create radio buttons with custom styles
/// to match your application's visual theme. It provides the [value] for the radio
/// button, the [groupValue] that determines which radio button is currently selected,
/// an [onChanged] callback for handling changes, and a [label] to display text next to the button.
///
/// The visual styling of the radio button can be customized using the [variant] property
/// from the `Variant` enum, which defines different visual styles.
class RadioButton<T> extends StatelessWidget {
  final Variant variant;
  final T value;
  final T groupValue;
  final ValueChanged<T?>? onChanged;
  final String label;

  /// Creates a `RadioButton` widget.
  ///
  /// The [value] is the value of this radio button.
  /// The [groupValue] is the value of the currently selected radio button in the group.
  /// The [onChanged] callback is invoked when the radio button's value changes.
  /// The [variant] is used to apply a custom visual style to the radio button.
  /// The [label] is the text displayed next to the radio button.
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
    VariantStyle style = getVariantStyle(variant);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Radio<T>(
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
            activeColor: style.backgroundColor),
        Text(label),
      ],
    );
  }
}
