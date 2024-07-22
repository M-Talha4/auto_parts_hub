import 'package:flutter/material.dart';
import '../text_size.dart';
import '../imports.dart';

TextStyle textStyle(Color color, double fontSize, FontWeight fontWeight) {
  return TextStyle(
      color: color,
      fontSize: fontSize,
      fontFamily: appFontFamily,
      fontWeight: fontWeight);
}

TextStyle appTextStyle(
    {Color? color, double? fontSize, FontWeight? fontWeight, double? spacing}) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontFamily: appFontFamily,
    fontWeight: fontWeight,
    letterSpacing: spacing,
  );
}

TextTheme get lightTextTheme => TextTheme(
      displayLarge: textStyle(colorSchemeLight.onPrimary,
          AppTextSize.displayLargeFont, FontWeight.w300),
      displayMedium: textStyle(colorSchemeLight.onPrimary,
          AppTextSize.displayMediumFont, FontWeight.w300),
      displaySmall: textStyle(colorSchemeLight.onPrimary,
          AppTextSize.displaySmallFont, FontWeight.w400),
      headlineLarge: textStyle(colorSchemeLight.onPrimary,
          AppTextSize.headlineLargeFont, FontWeight.w400),
      headlineMedium: textStyle(colorSchemeLight.onPrimary,
          AppTextSize.headlineMediumFont, FontWeight.w400),
      headlineSmall: textStyle(colorSchemeLight.onPrimary,
          AppTextSize.headlineSmallFont, FontWeight.w400),
      titleLarge: textStyle(colorSchemeLight.onPrimary,
          AppTextSize.titleLargeFont, FontWeight.w500),
      titleMedium: textStyle(colorSchemeLight.onPrimary,
          AppTextSize.titleMediumFont, FontWeight.w400),
      titleSmall: textStyle(colorSchemeLight.onPrimary,
          AppTextSize.titleSmallFont, FontWeight.w500),
      bodyLarge: textStyle(colorSchemeLight.onSurface,
          AppTextSize.bodyLargeFont, FontWeight.w400),
      bodyMedium: textStyle(colorSchemeLight.onSurface,
          AppTextSize.bodyMediumFont, FontWeight.w400),
      bodySmall: textStyle(colorSchemeLight.onSurface,
          AppTextSize.bodySmallFont, FontWeight.w400),
      labelLarge: textStyle(colorSchemeLight.onPrimary,
          AppTextSize.labelLargeFont, FontWeight.w500),
      labelMedium: textStyle(colorSchemeLight.onPrimary,
          AppTextSize.labelMediumFont, FontWeight.w500),
      labelSmall: textStyle(colorSchemeLight.onSurface,
          AppTextSize.labelSmallFont, FontWeight.w400),
    );

TextTheme get darkTextTheme => TextTheme(
      displayLarge: textStyle(colorSchemeDark.onPrimary,
          AppTextSize.displayLargeFont, FontWeight.w300),
      displayMedium: textStyle(colorSchemeDark.onPrimary,
          AppTextSize.displayMediumFont, FontWeight.w300),
      displaySmall: textStyle(colorSchemeDark.onPrimary,
          AppTextSize.displaySmallFont, FontWeight.w400),
      headlineLarge: textStyle(colorSchemeDark.onPrimary,
          AppTextSize.headlineLargeFont, FontWeight.w400),
      headlineMedium: textStyle(colorSchemeDark.onPrimary,
          AppTextSize.headlineMediumFont, FontWeight.w400),
      headlineSmall: textStyle(colorSchemeDark.onPrimary,
          AppTextSize.headlineSmallFont, FontWeight.w400),
      titleLarge: textStyle(colorSchemeDark.onPrimary,
          AppTextSize.titleLargeFont, FontWeight.w500),
      titleMedium: textStyle(colorSchemeDark.onPrimary,
          AppTextSize.titleMediumFont, FontWeight.w400),
      titleSmall: textStyle(colorSchemeDark.onPrimary,
          AppTextSize.titleSmallFont, FontWeight.w500),
      bodyLarge: textStyle(colorSchemeDark.onSurface, AppTextSize.bodyLargeFont,
          FontWeight.w400),
      bodyMedium: textStyle(colorSchemeDark.onSurface,
          AppTextSize.bodyMediumFont, FontWeight.w400),
      bodySmall: textStyle(colorSchemeDark.onSurface, AppTextSize.bodySmallFont,
          FontWeight.w400),
      labelLarge: textStyle(colorSchemeDark.onPrimary,
          AppTextSize.labelLargeFont, FontWeight.w500),
      labelMedium: textStyle(colorSchemeDark.onPrimary,
          AppTextSize.labelMediumFont, FontWeight.w500),
      labelSmall: textStyle(colorSchemeDark.onSurface,
          AppTextSize.labelSmallFont, FontWeight.w400),
    );
