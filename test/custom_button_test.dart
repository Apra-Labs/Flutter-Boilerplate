import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_boilerplate/widgets/custom_button.dart';

void main() {
  testWidgets('CustomButton renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomButton(
            btnLabel: 'Test Button',
            onClick: () {}, // Provide a dummy callback function
          ),
        ),
      ),
    );

    // Verify that the button text is rendered.
    expect(find.text('Test Button'), findsOneWidget);

    // Verify that the button is a child of the CustomButton widget.
    expect(find.byType(TextButton), findsOneWidget);
  });
}
