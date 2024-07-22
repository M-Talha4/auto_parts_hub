import 'package:flutter/material.dart';
import 'imports.dart';

class AppTheme {
  AppTheme._();

  factory AppTheme() {
    return instance;
  }

  static final AppTheme instance = AppTheme._();

  ThemeData get light {
    return ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: colorSchemeLight,
        fontFamily: appFontFamily,
        appBarTheme: lightAppBarTheme,
        bottomNavigationBarTheme: lightBottomNavigationBarTheme,
        scaffoldBackgroundColor: LightAppColors.surface,
        floatingActionButtonTheme: lightFloatingActionButtonTheme,
        elevatedButtonTheme: lightElevatedButtonTheme,
        progressIndicatorTheme: lightProgressIndicatorTheme,
        cardTheme: lightCardTheme,
        switchTheme: lightSwitchTheme,
        tabBarTheme: lightTabBarTheme,
        bottomSheetTheme: lightBottomSheetTheme,
        dividerTheme: lightDividerTheme,
        iconTheme: lightIconTheme);
  }

  ThemeData get dark {
    return ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: colorSchemeDark,
        fontFamily: appFontFamily,
        appBarTheme: darkAppBarTheme,
        bottomNavigationBarTheme: darkBottomNavigationBarTheme,
        scaffoldBackgroundColor: DarkAppColors.surface,
        floatingActionButtonTheme: darkFloatingActionButtonTheme,
        elevatedButtonTheme: darkElevatedButtonTheme,
        progressIndicatorTheme: darkProgressIndicatorTheme,
        cardTheme: darkCardTheme,
        switchTheme: darkSwitchTheme,
        tabBarTheme: darkTabBarTheme,
        bottomSheetTheme: darkBottomSheetTheme,
        dividerTheme: darkDividerTheme,
        iconTheme: darkIconTheme);
  }
}
