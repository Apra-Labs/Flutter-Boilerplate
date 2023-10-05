import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/widgets/date_picker.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('DatePicker renders correctly', (WidgetTester tester) async {
    DateTime? selectedDate;
    void onDateChanged(DateTime newDate) {
      selectedDate = newDate;
    }

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DatePicker(
            selectedDate: DateTime.now(),
            label: 'Select a Date',
            onDateChanged: onDateChanged,
            fontsize: 20.0,
          ),
        ),
      ),
    );

    expect(find.text('Select a Date'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle(); // Wait for the dialog to close.

    expect(selectedDate, isNotNull);
  });
}
