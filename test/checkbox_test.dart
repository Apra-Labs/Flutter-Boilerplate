import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_boilerplate/widgets/checkbox.dart';

void main() {
  testWidgets('CheckboxButton renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CheckboxButton(
            value: false,
            label: 'Test Checkbox',
            onChanged: (newValue) {},
          ),
        ),
      ),
    );

    expect(find.text('Test Checkbox'), findsOneWidget);
    expect(find.byType(Checkbox), findsOneWidget);
  });

  testWidgets('CheckboxButton changes state correctly',
      (WidgetTester tester) async {
    bool? checkboxValue = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CheckboxButton(
            value: checkboxValue!,
            label: 'Test Checkbox',
            onChanged: (newValue) {
              checkboxValue = newValue;
            },
          ),
        ),
      ),
    );

    // Tap on the Checkbox to change its state.
    await tester.tap(find.byType(Checkbox));
    await tester.pump();

    // Verify that the onChanged callback was called and the state changed.
    expect(checkboxValue, true);
  });
}
