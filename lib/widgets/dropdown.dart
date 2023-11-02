import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/themes/color_schemes.dart';

//This drop down is only for input type as string
class DropDown<String> extends StatelessWidget {
  final List<String> items;
  final Function(String) onChanged;
  final BorderStyle? borderStyle;
  final double? borderRadius;
  final String? labelText;
  final bool filled;
  final Icon? icon;
  final Color? fillColor;
  final String? errorText;

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
