import 'package:flutter/material.dart';

class RouteUtils {
  static Future goToPage(BuildContext context, String route) {
    return Navigator.pushNamed(context, route);
  }

  static Future setRootPage(BuildContext context, String route) {
    return Navigator.pushReplacementNamed(context, route);
  }

  static Future setRootPageForever(BuildContext context, String route) {
    return Navigator.pushNamedAndRemoveUntil(context, route, (r) => false);
  }

  static void goBack(BuildContext context) {
    return Navigator.pop(context);
  }
}
