import 'dart:ui';
import 'package:flutter_boilerplate/utils/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///Add your app states [Global states] here.
///
final emailProvider = StateProvider<String>((_) => '');
final passwordProvider = StateProvider<String>((_) => '');
final nameProvider = StateProvider<String>((_) => '');
final appThemeProvider = StateProvider<bool>((ref) => false);
final appLanguage = StateProvider<Locale>((ref) => getDeviceLocale());
