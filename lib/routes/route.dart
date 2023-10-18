import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/modules/login/login_page.dart';
import 'package:flutter_boilerplate/modules/profile/profile_page.dart';
import 'package:flutter_boilerplate/modules/settings/settings_page.dart';
import 'package:flutter_boilerplate/modules/splash/splash_page.dart';
import 'package:flutter_boilerplate/modules/uikit/home_page.dart';

//to do: lazy loading

// Route Names
const String splashScreen = 'splash';
const String loginPage = 'login';
const String homePage = 'home';
const String profilePage = 'profile';
const String settingsPage = 'settings';

// Control your page route flow
Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case splashScreen:
      return MaterialPageRoute(builder: (context) => const SplashScreen());
    case loginPage:
      return MaterialPageRoute(builder: (context) => const LoginPage());
    case homePage:
      return MaterialPageRoute(builder: (context) => const HomePage());
    case profilePage:
      return MaterialPageRoute(builder: (context) => const ProfilePage());
    case settingsPage:
      return MaterialPageRoute(builder: (context) => const SettingsPage());
    default:
      throw ('This route name does not exit');
  }
}
