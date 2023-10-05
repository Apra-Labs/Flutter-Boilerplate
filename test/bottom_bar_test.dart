import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_boilerplate/widgets/bottom_bar.dart';

void main() {
  testWidgets("Bottom bar renders correctly",
      (WidgetTester widgetTester) async {
    await widgetTester.pumpWidget(
      MaterialApp(
        home: Scaffold(
            bottomNavigationBar: CustomBottomBar(
          items: [
            BottomBarItem(
              icon: Icons.settings,
              label: 'Settings',
              iconSize: 35,
            ),
            BottomBarItem(
              icon: Icons.person_pin_sharp,
              label: 'Profile',
              iconSize: 35,
            ),
            BottomBarItem(
              icon: Icons.assignment,
              label: 'UI Kit',
              iconSize: 35,
            ),
          ],
          selectedIndex: 0,
          onItemSelected: (value) {},
        )),
      ),
    );

    expect(find.text("Settings"), findsOneWidget);
    expect(find.text("Profile"), findsOneWidget);
    expect(find.text("UI Kit"), findsOneWidget);

    expect(find.byIcon(Icons.person_pin_sharp), findsOneWidget);
    expect(find.byIcon(Icons.assignment), findsOneWidget);
    expect(find.byIcon(Icons.settings), findsOneWidget);
  });
}
