import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_boilerplate/widgets/app_bar.dart';

void main() {
  testWidgets("App bar renders correctly", (WidgetTester widgetTester) async {
    await widgetTester.pumpWidget(MaterialApp(
      home: Scaffold(
          appBar: CustomAppBar(
        title: const Text("test App bar"),
        onClick: () {},
        showActionButton: true,
        iconName: Icons.language,
      )),
    ));

    expect(find.text("test App bar"), findsOneWidget);
    expect(find.byIcon(Icons.language), findsOneWidget);
  });
}
