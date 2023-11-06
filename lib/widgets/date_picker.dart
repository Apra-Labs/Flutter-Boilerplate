import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/themes/color_schemes.dart';
import 'package:flutter_boilerplate/themes/theme.dart';

/// A custom date picker widget that displays a label and a button to pick a date.
///
/// The `DatePicker` widget provides a convenient way to display a label and an
/// associated button to select a date using the Flutter date picker dialog.
///
/// You can specify the [selectedDate], the initial date to be displayed,
/// and an optional [onDateChanged] callback that will be called when a new date is selected.
///
/// The [label] parameter is used to display a label text before the date button.
///
/// The optional [fontsize] parameter allows you to customize the font size of the date text.
class DatePicker extends StatelessWidget {
  /// The currently selected date.
  final DateTime selectedDate;

  /// A callback function called when a new date is selected.
  final ValueChanged<DateTime>? onDateChanged;

  /// The label to be displayed next to the date button.
  final String label;

  /// The font size of the date text.
  final double? fontsize;

  /// Creates a `DatePicker` widget.
  ///
  /// The [selectedDate] parameter represents the initial date to be displayed.
  /// The [label] parameter specifies the label text to be displayed next to the date button.
  /// The [onDateChanged] parameter allows you to provide a callback function
  /// that is triggered when a new date is selected.
  /// The optional [fontsize] parameter lets you customize the font size of the date text.

  const DatePicker({
    super.key,
    required this.selectedDate,
    required this.label,
    this.onDateChanged,
    this.fontsize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label, style: const TextStyle(fontSize: FontSize.header)),
        const SizedBox(width: 15),
        ElevatedButton(
          onPressed: () async {
            final pickedDate = await showDatePicker(
              context: context,
              initialDate: selectedDate,
              firstDate: DateTime(2000),
              lastDate: DateTime(2101),
            );
            if (pickedDate != null && onDateChanged != null) {
              onDateChanged!(pickedDate);
            }
          },
          child: Text("${selectedDate.toLocal()}".split(' ')[0],
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontSize: fontsize, color: AppColorsPalette.dark)),
        ),
      ],
    );
  }
}
