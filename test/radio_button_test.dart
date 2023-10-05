import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/widgets/radio_button.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('RadioButton renders correctly', (WidgetTester tester) async {
    dynamic selectedValue;
    void onChanged(dynamic newValue) {
      selectedValue = newValue;
    }

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RadioButton(
            value: 'Option 1',
            groupValue: selectedValue,
            onChanged: onChanged,
            label: 'Select Option 1',
          ),
        ),
      ),
    );

    expect(find.byType(RadioButton), findsOneWidget);
    expect(find.byType(Radio), findsOneWidget);
    expect(find.text('Select Option 1'), findsOneWidget);

    await tester.tap(find.byType(Radio));
    await tester.pump();

    expect(selectedValue, 'Option 1');
  });
}
