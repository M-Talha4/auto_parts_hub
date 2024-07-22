import 'package:flutter/material.dart';
import '../imports.dart';

ProgressIndicatorThemeData get lightProgressIndicatorTheme =>
    ProgressIndicatorThemeData(
      color: colorSchemeLight.secondary,
      linearTrackColor: colorSchemeLight.surface,
      circularTrackColor: colorSchemeLight.surfaceContainerHighest,
    );
ProgressIndicatorThemeData get darkProgressIndicatorTheme =>
    ProgressIndicatorThemeData(
      color: colorSchemeDark.secondary,
      linearTrackColor: colorSchemeDark.surface,
      circularTrackColor: colorSchemeDark.surfaceContainerHighest,
    );
