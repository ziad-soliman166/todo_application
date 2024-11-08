import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/core/app_styles.dart';
import 'package:todo_application/core/colors_manager.dart';
import 'package:todo_application/settings_provider.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({Key? key}) : super(key: key);

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  String selectedTheme = 'Light';
  String selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<SettingsProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Theme label
          Text(
            AppLocalizations.of(context)!.themeLabel,
            style: myProvider.currentTheme == ThemeMode.light
                ? LightAppStyles.ThemeLabel
                : LightAppStyles.ThemeLabelDark,
          ),
          const SizedBox(height: 9),
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
                  onChanged: (newTheme) {
                    selectedTheme = newTheme ?? selectedTheme;
                    myProvider.changeAppTheme(
                      newTheme == "Light" ? ThemeMode.light : ThemeMode.dark,
                    );
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          // Language label
          Text(
            AppLocalizations.of(context)!.languageLabel,
            style: myProvider.currentTheme == ThemeMode.light
                ? LightAppStyles.ThemeLabel
                : LightAppStyles.ThemeLabelDark,
          ),
          const SizedBox(height: 9),
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
                  onChanged: (newLang) {
                    selectedLanguage = newLang ?? selectedLanguage;
                    myProvider
                        .changeAppLanguage(newLang == "English" ? 'en' : 'ar');
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Dropdown for Theme Selection
  Widget buildDropDownTheme(
          {required MenuItem item, required Function(String?) onChanged}) =>
      DropdownButton<String>(
        borderRadius: BorderRadius.circular(20),
        underline: const SizedBox(),
        items: <String>[item.item1, item.item2].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: onChanged,
      );

  // Dropdown for Language Selection
  Widget buildDropDownLang(
          {required MenuItem item, required Function(String?) onChanged}) =>
      DropdownButton<String>(
        borderRadius: BorderRadius.circular(20),
        underline: const SizedBox(),
        items: <String>[item.item1, item.item2].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: onChanged,
      );
}

class MenuItem {
  String item1;
  String item2;
  MenuItem({required this.item1, required this.item2});
}
