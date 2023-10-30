import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/color_schemes.dart';
import 'package:flutter_boilerplate/theme.dart';

class TimePicker extends StatelessWidget {
  final TimeOfDay selectedTime;
  final ValueChanged<TimeOfDay>? onTimeChanged;
  final String label;
  final double? fontsize;

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
