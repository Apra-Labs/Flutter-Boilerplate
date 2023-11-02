import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/themes/variants.dart';
import 'package:flutter_boilerplate/themes/color_schemes.dart';
import 'package:flutter_boilerplate/widgets/spinner.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CircularProgress renders correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CircularProgress(
            size: 40.0,
            variant: Variant.danger,
          ),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Verify that the CircularProgressIndicator has the correct properties.
    CircularProgressIndicator circularProgressIndicator =
        tester.widget(find.byType(CircularProgressIndicator));
    expect(circularProgressIndicator.strokeWidth, 4.0);

    // Verify that the valueColor is set correctly.
    expect(circularProgressIndicator.valueColor,
        isA<AlwaysStoppedAnimation<Color>>());
    expect(
        (circularProgressIndicator.valueColor as AlwaysStoppedAnimation<Color>)
            .value,
        AppColorsPalette.danger);
  });
}
