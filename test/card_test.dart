import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/widgets/custom_button.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_boilerplate/widgets/card.dart';

void main() {
  testWidgets("Card renders correctly", (WidgetTester widgetTester) async {
    await widgetTester.pumpWidget(MaterialApp(
        home: Scaffold(
      body: AppCard(
          body: Column(children: [
        const Text("this is test card"),
        CustomButton(
          btnLabel: "card test button",
          onClick: () {},
        )
      ])),
    )));

    expect(find.text("this is test card"), findsOneWidget);
    expect(find.byType(CustomButton), findsOneWidget);
    expect(find.text("card test button"), findsOneWidget);
  });
}
