import 'package:flutter_boilerplate/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

void storeLoggedInStatus(bool isLoggedIn) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setBool('isLoggedIn', isLoggedIn);
}

Future<bool> getLoggedInStatus() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getBool('isLoggedIn') ?? false;
}

void setLogginCredentails() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setStringList("email", LoginCredentials.emailList);
}
