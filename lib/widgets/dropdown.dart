import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/themes/color_schemes.dart';

/// A custom drop-down widget for selecting a string value.
///
/// The `DropDown` widget is designed for selecting a string value from a list of options.
/// It provides a dropdown button field with customizable appearance and behavior.
///
/// You can specify the [items] which represent the available options as a list of strings.
/// The [onChanged] callback is called when the selected value is changed.
///
/// You can customize the appearance of the dropdown using parameters like [borderStyle],
/// [borderRadius], [labelText], [filled], [icon], [fillColor], and [errorText].
///
/// The dropdown only supports input type as a string.
class DropDown<String> extends StatelessWidget {
  /// The list of available options for selection.
  final List<String> items;

  /// A callback function called when the selected value is changed.
  final Function(String) onChanged;

  /// The style of the dropdown's border.
  final BorderStyle? borderStyle;

  /// The radius of the dropdown's border.
  final double? borderRadius;

  /// The label text displayed above the dropdown.
  final String? labelText;

  /// Whether the dropdown should be filled with color.
  final bool filled;

  /// An optional icon to display within the dropdown.
  final Icon? icon;

  /// The color used to fill the dropdown if [filled] is set to `true`.
  final Color? fillColor;

  /// The error text to display, if any.
  final String? errorText;

  /// Creates a `DropDown` widget.
  ///
  /// The [items] parameter specifies the list of available options for selection.
  /// The [onChanged] parameter is a callback function that is triggered when the selected value is changed.
  /// The optional [borderStyle] parameter allows you to customize the style of the dropdown's border.
  /// The [borderRadius] parameter sets the radius of the dropdown's border.
  /// The [labelText] parameter is used to display a label text above the dropdown.
  /// The [filled] parameter determines whether the dropdown should be filled with color.
  /// The [icon] parameter is an optional icon to display within the dropdown.
  /// The [fillColor] parameter is the color used to fill the dropdown when [filled] is `true`.
  /// The [errorText] parameter specifies the error text to display, if any.

  const DropDown(
      {Key? key,
      required this.items,
      required this.onChanged,
      this.borderStyle = BorderStyle.solid,
      this.borderRadius = 5,
      this.labelText,
      this.filled = false,
      this.icon,
      this.fillColor = AppColorsPalette.gray,
      this.errorText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value.toString()),
          );
        }).toList(),
        icon: icon,
        decoration: InputDecoration(
          filled: filled,
          fillColor: fillColor,
          errorText: errorText?.toString(),
          labelText: labelText?.toString(),
          contentPadding: const EdgeInsets.all(20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
            borderSide: BorderSide(style: borderStyle ?? BorderStyle.solid),
          ),
        ),
        onChanged: (val) {
          onChanged(val!);
        });
  }
}
