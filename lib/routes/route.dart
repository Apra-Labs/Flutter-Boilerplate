import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/modules/login/presentation.dart';
import 'package:flutter_boilerplate/modules/profile/presentation.dart';
import 'package:flutter_boilerplate/modules/splash/presentation.dart';
import 'package:flutter_boilerplate/modules/uikit/home_page.dart';

// Route Names
const String splashScreen = 'splash';
const String loginPage = 'login';
const String homePage = 'home';
const String profilePage = 'profile';

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
      return MaterialPageRoute(builder: (context) => ProfilePage());
    default:
      throw ('This route name does not exit');
  }
}
