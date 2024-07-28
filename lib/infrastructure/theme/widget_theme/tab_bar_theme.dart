import 'package:flutter/material.dart';
import '../imports.dart';

TabBarTheme get lightTabBarTheme => TabBarTheme(
    indicatorSize: TabBarIndicatorSize.tab,
    labelColor: colorSchemeLight.onPrimary,
    unselectedLabelColor: colorSchemeLight.secondary,
    indicator: BoxDecoration(color: colorSchemeLight.secondary));
TabBarTheme get darkTabBarTheme => TabBarTheme(
    indicatorSize: TabBarIndicatorSize.tab,
    labelColor: colorSchemeDark.onPrimary,
    unselectedLabelColor: colorSchemeDark.outline,
    indicator: BoxDecoration(color: colorSchemeDark.secondary));
