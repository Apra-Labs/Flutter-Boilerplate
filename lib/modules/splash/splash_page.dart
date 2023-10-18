import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/utils/route_utils.dart';
import 'package:flutter_boilerplate/utils/shared_preferences_utils.dart';
import 'package:flutter_boilerplate/theme.dart';
import '../../routes/route.dart' as route;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this, value: 0.1);
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.easeInCubic);

    _controller.forward();
    setLogginCredentails();
    checkLoginStatusAndNavigate();
    super.initState();
  }

  void checkLoginStatusAndNavigate() async {
    bool isLoggedIn = await getLoggedInStatus();
    if (isLoggedIn) {
      Timer(const Duration(seconds: 4),
          () => RouteUtils.setRootPage(context, route.profilePage));
    } else {
      Timer(const Duration(seconds: 4),
          () => RouteUtils.setRootPage(context, route.loginPage));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(children: [
        ScaleTransition(
          scale: _animation,
          child: const Center(
              child: Image(
            image: AssetImage("assets/apra_logo.png"),
          )),
        ),
        const Padding(
          padding: EdgeInsets.all(25.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              "\u00a9 Apra Labs Private Limited",
              style: TextStyle(
                color: AppColors.primary,
              ),
            ),
          ),
        )
      ]),
    );
  }
}
