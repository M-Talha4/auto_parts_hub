import 'package:flutter/material.dart';
import '../text_size.dart';
import '../imports.dart';
import 'text_theme.dart';

AppBarTheme get lightAppBarTheme => AppBarTheme(
      titleTextStyle: appTextStyle(
          fontWeight: FontWeight.w500,
          color: colorSchemeLight.primary,
          fontSize: AppTextSize.titleLargeFont,
          spacing: 1),
      elevation: 1,
      shadowColor: colorSchemeLight.outline,
      backgroundColor: colorSchemeLight.onPrimary,
      actionsIconTheme: IconThemeData(color: colorSchemeLight.primary),
      iconTheme: IconThemeData(color: colorSchemeLight.primary),
    );
AppBarTheme get darkAppBarTheme => AppBarTheme(
      titleTextStyle: appTextStyle(
          fontWeight: FontWeight.w500,
          color: colorSchemeDark.primary,
          fontSize: AppTextSize.titleLargeFont,
          spacing: 1),
      elevation: 2,
      shadowColor: colorSchemeDark.outline,
      backgroundColor: colorSchemeDark.onPrimary,
      actionsIconTheme: IconThemeData(color: colorSchemeDark.primary),
      iconTheme: IconThemeData(color: colorSchemeDark.primary),
    );
