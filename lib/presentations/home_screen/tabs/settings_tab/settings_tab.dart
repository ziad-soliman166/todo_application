import 'package:flutter/material.dart';
import 'package:todo_application/core/app_styles.dart';
import 'package:todo_application/core/colors_manager.dart';

class SettingsTab extends StatefulWidget {
  SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  String selectedTheme = 'Light';
  String selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Theme",
            style: LightAppStyles.ThemeLabel,
          ),
          const SizedBox(
            height: 9,
          ),
          Container(
            height: 48,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              border: Border.all(width: 1, color: ColorsManager.blue),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedTheme,
                  style: LightAppStyles.SelectedItemLabel,
                ),
                buildDropDownTheme(
                  item: MenuItem(item1: "Light", item2: "Dark"),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            "Language",
            style: LightAppStyles.ThemeLabel,
          ),
          const SizedBox(
            height: 9,
          ),
          Container(
            height: 48,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              border: Border.all(width: 1, color: ColorsManager.blue),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedLanguage,
                  style: LightAppStyles.SelectedItemLabel,
                ),
                buildDropDownLang(
                  item: MenuItem(item1: "English", item2: "Arabic"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDropDownTheme({required MenuItem item}) => DropdownButton<String>(
        borderRadius: BorderRadius.circular(20),
        underline: const SizedBox(),
        items: <String>[item.item1, item.item2].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (newTheme) {
          selectedTheme = newTheme ?? selectedTheme;
          setState(() {});
        },
      );
  Widget buildDropDownLang({required MenuItem item}) => DropdownButton<String>(
        borderRadius: BorderRadius.circular(20),
        underline: const SizedBox(),
        items: <String>[item.item1, item.item2].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (newLang) {
          selectedLanguage = newLang ?? selectedLanguage;
          setState(() {});
        },
      );
}

class MenuItem {
  String item1;
  String item2;
  MenuItem({required this.item1, required this.item2});
}
