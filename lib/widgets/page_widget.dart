import 'package:flutter/material.dart';

/// A customizable page widget that provides a scaffold for your content.
class CustomPage extends StatelessWidget {
  /// The main content to display within the page.
  final Widget body;

  /// An optional app bar to display at the top of the page.
  final PreferredSizeWidget? appBar;

  /// An optional bottom bar, such as a bottom navigation bar, to display at the bottom of the page.
  final Widget? bottomBar;

  /// Creates a `CustomPage` widget with customizable content and layout.
  const CustomPage({
    super.key,
    required this.body,
    this.appBar,
    this.bottomBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: body,
      bottomNavigationBar: bottomBar,
    );
  }
}
