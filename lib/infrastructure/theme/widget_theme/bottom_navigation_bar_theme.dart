import 'package:flutter/material.dart';
import '../imports.dart';

BottomNavigationBarThemeData get lightBottomNavigationBarTheme =>
    BottomNavigationBarThemeData(
      selectedIconTheme:
          IconThemeData(color: colorSchemeLight.primary, size: 30),
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
      showUnselectedLabels: true,
      unselectedItemColor: colorSchemeLight.outlineVariant,
    );
BottomNavigationBarThemeData get darkBottomNavigationBarTheme =>
    BottomNavigationBarThemeData(
      selectedIconTheme:
          IconThemeData(color: colorSchemeDark.primary, size: 30),
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
      showUnselectedLabels: true,
      unselectedItemColor: colorSchemeDark.outlineVariant,
    );
