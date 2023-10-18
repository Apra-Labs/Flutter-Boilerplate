import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/widgets/button.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_boilerplate/widgets/alert.dart';

void main() {
  testWidgets('Alert renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Alert(
            title: 'Test Title',
            message: 'Test Message',
            onAccept: () {}, // Provide dummy callback functions
            onDeny: () {},
          ),
        ),
      ),
    );

    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('Test Message'), findsOneWidget);

    // Verify the presence of CustomButton widgets.
    expect(find.byType(CustomButton), findsNWidgets(2));
  });
}
