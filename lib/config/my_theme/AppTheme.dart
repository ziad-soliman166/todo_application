import 'package:flutter/material.dart';
import 'package:todo_application/core/app_styles.dart';
import 'package:todo_application/core/colors_manager.dart';

class AppTheme {
  static ThemeData light = ThemeData(
      colorScheme: ColorScheme.fromSeed(
          seedColor: ColorsManager.blue,
          primary: ColorsManager.blue,
          onPrimary: ColorsManager.white),
      useMaterial3: false,
      appBarTheme: AppBarTheme(
          backgroundColor: ColorsManager.blue,
          elevation: 12,
          titleTextStyle: LightAppStyles.AppBarLight),
      scaffoldBackgroundColor: ColorsManager.scaffold,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        selectedItemColor: ColorsManager.blue,
        unselectedItemColor: ColorsManager.grey,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedIconTheme: IconThemeData(size: 30),
        unselectedIconTheme: IconThemeData(size: 30),
      ),
      bottomAppBarTheme: BottomAppBarTheme(
        shape: CircularNotchedRectangle(),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: ColorsManager.blue,
        iconSize: 26,
      ));

  ///////////////////////////////////////////////////////Dark/////////////////////////////////////////////////////
  static ThemeData dark = ThemeData();
}
