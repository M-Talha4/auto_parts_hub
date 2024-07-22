import 'package:flutter/material.dart';
import '../text_size.dart';
import '../imports.dart';
import 'text_theme.dart';

AppBarTheme get lightAppBarTheme => AppBarTheme(
      titleTextStyle: appTextStyle(
          fontWeight: FontWeight.w500,
          color: colorSchemeLight.surface,
          fontSize: AppTextSize.titleLargeFont,
          spacing: 1),
      elevation: 0,
      backgroundColor: colorSchemeLight.primary,
      actionsIconTheme: IconThemeData(color: colorSchemeLight.onPrimary),
      iconTheme: IconThemeData(color: colorSchemeLight.onPrimary),
    );
AppBarTheme get darkAppBarTheme => AppBarTheme(
      titleTextStyle: appTextStyle(
          fontWeight: FontWeight.w500,
          color: colorSchemeDark.surface,
          fontSize: AppTextSize.titleLargeFont,
          spacing: 1),
      elevation: 0,
      backgroundColor: colorSchemeDark.primary,
      actionsIconTheme: IconThemeData(color: colorSchemeDark.onPrimary),
      iconTheme: IconThemeData(color: colorSchemeDark.onPrimary),
    );
