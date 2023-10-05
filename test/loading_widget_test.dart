import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/widgets/dots_loader.dart';
import 'package:flutter_boilerplate/widgets/loading_widget.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('LoadingProgressBar renders correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: LoadingProgressBar(),
        ),
      ),
    );

    expect(find.byType(LoadingProgressBar), findsOneWidget);
    expect(find.byType(AlertDialog), findsOneWidget);

    expect(find.byType(Image), findsOneWidget);
    expect(find.byType(SizedBox), findsOneWidget);
    expect(find.byType(LoadingDots), findsOneWidget);
  });
}
