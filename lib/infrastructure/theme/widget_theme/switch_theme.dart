import '/infrastructure/theme/app_color_scheme.dart';
import 'package:flutter/material.dart';
import '../imports.dart';

SwitchThemeData get lightSwitchTheme => SwitchThemeData(
      trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
      trackOutlineWidth: const WidgetStatePropertyAll(0),
      trackColor:
          WidgetStatePropertyAll(colorSchemeLight.outline.withAlpha(51)),
      thumbColor: WidgetStatePropertyAll(
        colorSchemeLight.surface,
      ),
    );
SwitchThemeData get darkSwitchTheme => SwitchThemeData(
      trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
      trackOutlineWidth: const WidgetStatePropertyAll(0),
      trackColor: WidgetStatePropertyAll(colorSchemeDark.outline.withAlpha(51)),
      thumbColor: WidgetStatePropertyAll(
        colorSchemeDark.primary,
      ),
    );
