import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/widgets/theme.dart';

class DatePicker extends StatelessWidget {
  final DateTime selectedDate;
  final ValueChanged<DateTime>? onDateChanged;
  final String label;
  final double? fontsize;

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
          child: Text(
            "${selectedDate.toLocal()}".split(' ')[0],
            style: TextStyle(
                fontSize: fontsize ?? 28, fontWeight: FontWeight.normal),
          ),
        ),
      ],
    );
  }
}
