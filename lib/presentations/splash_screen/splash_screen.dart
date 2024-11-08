import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/core/assets_manager.dart';
import 'package:todo_application/core/routes_manager.dart';
import 'package:todo_application/settings_provider.dart';

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
    var myProvider = Provider.of<SettingsProvider>(context);
    return Container(
      child: myProvider.currentTheme == ThemeMode.light
          ? Image.asset(AssetsManager.splashScreenLight)
          : Image.asset(AssetsManager.splashScreenDark),
    );
  }
}
