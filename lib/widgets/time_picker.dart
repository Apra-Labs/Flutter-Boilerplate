import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/themes/color_schemes.dart';
import 'package:flutter_boilerplate/themes/theme.dart';

/// A customizable time picker field with various styling options.
///
/// The `TimePicker` widget provides a flexible time picker field that can be customized
/// with options such as [label], [fontsize], and [onTimeChanged].
/// You can also specify the initial selected time using [selectedTime].

class TimePicker extends StatelessWidget {
  final TimeOfDay selectedTime;
  final ValueChanged<TimeOfDay>? onTimeChanged;
  final String label;
  final double? fontsize;

  /// Creates a `TimePicker` widget.
  ///
  /// The [key] is an optional parameter that can be used to identify this widget.
  /// The [selectedTime] is the initial time to display in the time picker.
  /// The [label] is the text that appears as a label for the time picker.
  /// The [fontsize] is the font size of the displayed time.
  /// The [onTimeChanged] callback is triggered when the selected time changes.

  const TimePicker({
    super.key,
    required this.selectedTime,
    required this.label,
    this.onTimeChanged,
    this.fontsize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label, style: const TextStyle(fontSize: FontSize.header)),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () async {
            final pickedTime = await showTimePicker(
              context: context,
              initialTime: selectedTime,
            );
            if (pickedTime != null && onTimeChanged != null) {
              onTimeChanged!(pickedTime);
            }
          },
          child: Text(selectedTime.format(context),
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: fontsize, color: AppColorsPalette.dark)),
        ),
      ],
    );
  }
}
