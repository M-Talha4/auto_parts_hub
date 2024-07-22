import 'package:auto_parts_hub/infrastructure/theme/app_color_scheme.dart';
import 'package:flutter/material.dart';
import '../imports.dart';

SwitchThemeData get lightSwitchTheme => SwitchThemeData(
      trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
      trackOutlineWidth: const WidgetStatePropertyAll(0),
      trackColor:
          WidgetStatePropertyAll(colorSchemeLight.outline.withOpacity(0.2)),
      thumbColor: WidgetStatePropertyAll(
        colorSchemeLight.surface,
      ),
    );
SwitchThemeData get darkSwitchTheme => SwitchThemeData(
      trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
      trackOutlineWidth: const WidgetStatePropertyAll(0),
      trackColor:
          WidgetStatePropertyAll(colorSchemeDark.outline.withOpacity(0.2)),
      thumbColor: WidgetStatePropertyAll(
        colorSchemeDark.primary,
      ),
    );
