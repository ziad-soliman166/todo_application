import 'package:flutter/material.dart';
import 'package:todo_application/presentations/home_screen/home_screen.dart';
import 'package:todo_application/presentations/splash_screen/splash_screen.dart';

class RoutesManager {
  static const String homeRoute = "/home";
  static const String SplashRoute = "/splash";

  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case SplashRoute:
        return MaterialPageRoute(
          builder: (context) => SplashScreen(),
        );
      case homeRoute:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );
    }
  }
}
