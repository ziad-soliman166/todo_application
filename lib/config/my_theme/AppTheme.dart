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
        elevation: 0,
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
    bottomAppBarTheme: const BottomAppBarTheme(
      shape: CircularNotchedRectangle(),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorsManager.blue,
      iconSize: 26,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: ColorsManager.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          topLeft: Radius.circular(15),
        ),
      ),
    ),
    cardTheme: CardTheme(
      color: ColorsManager.white,
    ),
  );

  ///////////////////////////////////////////////////////Dark/////////////////////////////////////////////////////
  static ThemeData dark = ThemeData(
    colorScheme: ColorScheme.fromSeed(
        seedColor: ColorsManager.blue,
        primary: ColorsManager.blue,
        onPrimary: ColorsManager.darkBottomSheet),
    useMaterial3: false,
    appBarTheme: AppBarTheme(
        backgroundColor: ColorsManager.blueAccent,
        elevation: 0,
        titleTextStyle: LightAppStyles.AppBarDark),
    scaffoldBackgroundColor: ColorsManager.darkScaffold,
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
    bottomAppBarTheme: const BottomAppBarTheme(
      color: ColorsManager.darkBottomSheet,
      shape: CircularNotchedRectangle(),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorsManager.blue,
      iconSize: 26,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: ColorsManager.darkBottomSheet,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          topLeft: Radius.circular(15),
        ),
      ),
    ),
    cardTheme: CardTheme(
      color: ColorsManager.darkBottomSheet,
    ),
  );
}
