import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/widgets/text_input.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('TextInput widget renders correctly',
      (WidgetTester tester) async {
    TextEditingController textController = TextEditingController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TextInput(
            controller: textController,
            labelText: 'Username',
            hintText: 'Enter your username',
            icon: Icons.person,
            keyboardType: TextInputType.text,
            obscureText: false,
            onChanged: (value) {},
          ),
        ),
      ),
    );

    expect(find.byType(TextInput), findsOneWidget);
    expect(find.byType(TextFormField), findsOneWidget);
    expect(find.byType(Icon), findsOneWidget);
    expect(find.text('Username'), findsOneWidget);
    expect(find.text('Enter your username'), findsOneWidget);

    await tester.enterText(find.byType(TextFormField), 'JohnDoe');
    await tester.pump();

    expect(textController.text, 'JohnDoe');
  });
}
