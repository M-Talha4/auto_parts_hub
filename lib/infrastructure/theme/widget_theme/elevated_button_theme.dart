import 'package:flutter/material.dart';
import '../imports.dart';

ElevatedButtonThemeData get lightElevatedButtonTheme => ElevatedButtonThemeData(
      style: ButtonStyle(
        splashFactory: InkRipple.splashFactory,
        backgroundColor: WidgetStateProperty.all(colorSchemeLight.primary),
        foregroundColor: WidgetStateProperty.all(colorSchemeLight.onPrimary),
        overlayColor: WidgetStateProperty.all(
            colorSchemeLight.secondary.withOpacity(0.2)),
        shadowColor: WidgetStateProperty.all(colorSchemeLight.shadow),
        elevation: WidgetStateProperty.all(2),
        textStyle: WidgetStateProperty.all(
          const TextStyle(
            fontSize: 16,
          ),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
ElevatedButtonThemeData get darkElevatedButtonTheme => ElevatedButtonThemeData(
      style: ButtonStyle(
        splashFactory: InkRipple.splashFactory,
        backgroundColor: WidgetStateProperty.all(colorSchemeDark.primary),
        foregroundColor: WidgetStateProperty.all(colorSchemeDark.onPrimary),
        overlayColor:
            WidgetStateProperty.all(colorSchemeDark.secondary.withOpacity(0.2)),
        shadowColor: WidgetStateProperty.all(colorSchemeDark.shadow),
        elevation: WidgetStateProperty.all(2),
        textStyle: WidgetStateProperty.all(
          const TextStyle(
            fontSize: 16,
          ),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
