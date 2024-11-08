import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/core/routes_manager.dart';
import 'package:todo_application/settings_provider.dart';

import '../config/my_theme/AppTheme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<SettingsProvider>(context);
    return ScreenUtilInit(
      designSize: Size(412, 870),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: myProvider.currentTheme,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RoutesManager.router,
        initialRoute: RoutesManager.SplashRoute,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: [
          Locale('en'), // English
          Locale('ar'), // Spanish
        ],
        locale: Locale(myProvider.currentLanguage),
      ),
    );
  }
}
