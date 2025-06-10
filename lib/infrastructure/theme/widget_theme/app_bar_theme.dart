import 'package:flutter/material.dart';
import '../text_size.dart';
import '../imports.dart';
import 'text_theme.dart';

AppBarTheme get lightAppBarTheme => AppBarTheme(
      titleTextStyle: appTextStyle(
          fontWeight: FontWeight.w600,
          color: colorSchemeLight.primary,
          fontSize: AppTextSize.titleLargeFont,
          spacing: 1),
      elevation: 0,
      shadowColor: colorSchemeLight.outline,
      backgroundColor: colorSchemeLight.surface,
      actionsIconTheme: IconThemeData(color: colorSchemeLight.primary),
      iconTheme: IconThemeData(color: colorSchemeLight.primary),
    );
AppBarTheme get darkAppBarTheme => AppBarTheme(
      titleTextStyle: appTextStyle(
          fontWeight: FontWeight.w600,
          color: colorSchemeDark.primary,
          fontSize: AppTextSize.titleLargeFont,
          spacing: 1),
      elevation: 0,
      shadowColor: colorSchemeDark.outline,
      backgroundColor: colorSchemeDark.surface,
      actionsIconTheme: IconThemeData(color: colorSchemeDark.primary),
      iconTheme: IconThemeData(color: colorSchemeDark.primary),
    );
