import 'package:flutter/material.dart';
import '../imports.dart';

CardTheme get lightCardTheme => CardTheme(
      color: colorSchemeLight.surface,
      elevation: 8,
      shadowColor: colorSchemeLight.outline,
      surfaceTintColor: colorSchemeLight.surface,
    );
CardTheme get darkCardTheme => CardTheme(
      color: colorSchemeDark.surface,
      elevation: 8,
      shadowColor: colorSchemeDark.outline,
      surfaceTintColor: colorSchemeDark.surface,
    );
