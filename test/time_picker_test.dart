import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/widgets/time_picker.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('TimePicker widget renders correctly',
      (WidgetTester tester) async {
    TimeOfDay? selectedTime;
    void onTimeChanged(TimeOfDay newTime) {
      selectedTime = newTime;
    }

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TimePicker(
            selectedTime: TimeOfDay.now(),
            label: 'Select a Time',
            onTimeChanged: onTimeChanged,
            fontsize: 20.0,
          ),
        ),
      ),
    );

    expect(find.byType(TimePicker), findsOneWidget);
    expect(find.byType(Row), findsOneWidget);
    expect(find.text('Select a Time'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle(); // Wait for the time picker dialog to appear.

    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle(); // Wait for the dialog to close.

    expect(selectedTime, isNotNull);
  });
}
