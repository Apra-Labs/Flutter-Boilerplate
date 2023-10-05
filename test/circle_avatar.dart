import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/widgets/circle_avatar.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CustomCircleAvatar renders correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomCircleAvatar(
            radius: 50.0,
            backgroundColor: Colors.blue,
            child: const Icon(Icons.person),
            onTap: () {},
          ),
        ),
      ),
    );

    expect(find.byType(CircleAvatar), findsOneWidget);
    expect(find.byType(Icon), findsOneWidget);

    await tester.tap(find.byType(CircleAvatar));
    await tester.pump();
  });
}
