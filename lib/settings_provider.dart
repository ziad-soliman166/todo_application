// // lib/settings_provider.dart
//
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class SettingsProvider extends ChangeNotifier {
//   bool _isDarkTheme = false;
//   bool _isEnglish = true;
//
//   bool get isDarkTheme => _isDarkTheme;
//   bool get isEnglish => _isEnglish;
//
//   SettingsProvider() {
//     _loadSettings();
//   }
//
//   // Load settings from SharedPreferences
//   void _loadSettings() async {
//     final prefs = await SharedPreferences.getInstance();
//     _isDarkTheme = prefs.getBool('isDarkTheme') ?? false;
//     _isEnglish = prefs.getBool('isEnglish') ?? true;
//     notifyListeners();
//   }
//
//   // Toggle theme and persist the choice
//   void setTheme(bool isDark) async {
//     _isDarkTheme = isDark;
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setBool('isDarkTheme', isDark);
//     notifyListeners();
//   }
//
//   // Toggle language and persist the choice
//   void setLanguage(bool isEnglish) async {
//     _isEnglish = isEnglish;
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setBool('isEnglish', isEnglish);
//     notifyListeners();
//   }
// }
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;
  String currentLanguage = 'en';

  void changeAppTheme(ThemeMode newTheme) {
    if (newTheme == currentTheme) return;
    currentTheme = newTheme;
    saveTheme(newTheme);
    notifyListeners();
  }

  void changeAppLanguage(String newLanguage) {
    if (currentLanguage == newLanguage) return;
    currentLanguage = newLanguage;
    notifyListeners();
  }

  void saveTheme(ThemeMode themeMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('theme', themeMode == ThemeMode.light ? 'light' : 'dark');
  }

  void getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? theme = prefs.getString('theme');
    currentTheme = (theme == 'dark') ? ThemeMode.dark : ThemeMode.light;
    notifyListeners(); // Notify listeners after loading the theme
  }
}
