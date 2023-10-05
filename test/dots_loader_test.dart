import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/widgets/dots_loader.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Dot Widget Tests', () {
    testWidgets('Dot Widget - Circle', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Dot(
              radius: 10.0,
              color: Colors.blue,
              type: DotType.circle,
              icon: Icon(Icons.blur_on),
            ),
          ),
        ),
      );

      // Verify that the Dot widget with a circle type is rendered.
      expect(find.byType(Dot), findsOneWidget);
      expect(find.byType(Icon), findsNothing);
      expect(find.byType(Container), findsOneWidget);
    });

    testWidgets('Dot Widget - Icon', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Dot(
              radius: 10.0,
              color: Colors.blue,
              type: DotType.icon,
              icon: Icon(Icons.blur_on),
            ),
          ),
        ),
      );

      // Verify that the Dot widget with an icon type is rendered.
      expect(find.byType(Dot), findsOneWidget);
      expect(find.byType(Icon), findsOneWidget);
      expect(find.byType(Container), findsNothing);
    });
  });

  testWidgets('LoadingDots Widget Renders', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: LoadingDots(
            dotOneColor: Colors.red,
            dotTwoColor: Colors.green,
            dotThreeColor: Colors.blue,
            duration: Duration(milliseconds: 1000),
            dotType: DotType.circle,
            dotIcon: Icon(Icons.blur_on),
            radius: 15.0,
          ),
        ),
      ),
    );

    // Verify that the LoadingDots widget renders without any errors.
    expect(find.byType(LoadingDots), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
