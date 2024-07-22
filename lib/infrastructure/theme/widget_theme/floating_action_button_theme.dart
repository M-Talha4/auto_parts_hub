import 'package:flutter/material.dart';
import '../imports.dart';

FloatingActionButtonThemeData get lightFloatingActionButtonTheme =>
    FloatingActionButtonThemeData(
      backgroundColor: colorSchemeLight.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
    );
FloatingActionButtonThemeData get darkFloatingActionButtonTheme =>
    FloatingActionButtonThemeData(
      backgroundColor: colorSchemeDark.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
    );
