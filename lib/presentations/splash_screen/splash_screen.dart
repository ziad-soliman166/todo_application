import 'package:flutter/material.dart';
import 'package:todo_application/core/assets_manager.dart';
import 'package:todo_application/core/routes_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (mounted) {
          Navigator.pushReplacementNamed(context, RoutesManager.homeRoute);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(AssetsManager.splashScreenLight),
    );
  }
}
