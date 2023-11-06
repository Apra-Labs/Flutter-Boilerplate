import 'package:flutter/material.dart';
import 'dart:io';

Locale getDeviceLocale() {
  final String defaultLocale = Platform.localeName.split('_')[0];
  print("defaultLocale = $defaultLocale");
  return Locale(defaultLocale);
}

class Texts {
  static const String acceptLabel = "OK";
  static const String closeLabel = "Close";
  static const String denyLabel = "Cancel";
}

class LoginCredentials {
  static const List<String> emailList = [
    "swagats@apra.in",
    "manjunathh@apra.in",
    "deepakj@apra.in"
  ];
}

enum Gender { male, female, other }

Widget setText(String text) {
  return (Text(text));
}

Widget setTextWithStyle(String text, TextStyle? style) {
  return (Text(
    text,
    style: style,
  ));
}
