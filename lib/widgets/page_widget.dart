import 'package:flutter/material.dart';

class CustomPage extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomBar;

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
