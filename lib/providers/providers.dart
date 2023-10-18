import 'package:flutter_riverpod/flutter_riverpod.dart';

final emailProvider = StateProvider<String>((_) => '');
final passwordProvider = StateProvider<String>((_) => '');
final nameProvider = StateProvider<String>((_) => '');
final appThemeProvider = StateProvider<bool>((ref) => false);
