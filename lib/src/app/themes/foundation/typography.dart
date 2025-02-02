import 'package:flutter/material.dart';

class AppTypography {
  const AppTypography({
    required this.colorScheme,
    required this.primaryFont,
    this.secondaryFont,
    this.tertiaryFont,
  });

  final ColorScheme colorScheme;
  final String primaryFont;
  final String? secondaryFont;
  final String? tertiaryFont;

  Color get color => colorScheme.onSurface;

  TextTheme toTextTheme() {
    // TODO: define your typography
    return TextTheme(
      headlineLarge: TextStyle(
        fontSize: 36,
        height: 40.0 / 36.0,
        fontFamily: primaryFont,
        color: color,
      ),
      headlineMedium: TextStyle(
        fontSize: 32,
        height: 36.0 / 32.0,
        fontFamily: primaryFont,
        color: color,
      ),
      headlineSmall: TextStyle(
        fontSize: 28,
        height: 32.0 / 23.0,
        fontFamily: primaryFont,
        color: color,
      ),
      titleLarge: TextStyle(
        fontSize: 24,
        height: 30.0 / 26.0,
        fontFamily: primaryFont,
        color: color,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        height: 28.0 / 24.0,
        fontFamily: primaryFont,
        color: color,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        height: 24.0 / 20.0,
        fontFamily: primaryFont,
        color: color,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        height: 20.0 / 16.0,
        fontFamily: primaryFont,
        color: color,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        height: 18.0 / 14.0,
        fontFamily: primaryFont,
        color: color,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        height: 16.0 / 12.0,
        fontFamily: primaryFont,
        color: color,
      ),
      displayLarge: TextStyle(
        fontSize: 8,
        height: 16.0 / 12.0,
        fontFamily: primaryFont,
        color: color,
      ),
      displayMedium: TextStyle(
        fontSize: 10,
        height: 14.0 / 10.0,
        fontFamily: primaryFont,
        color: color,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        height: 18.0 / 14.0,
        fontFamily: primaryFont,
        color: color,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        height: 16.0 / 12.0,
        fontFamily: secondaryFont,
        color: color,
      ),
      labelSmall: TextStyle(
        fontSize: 10,
        height: 14.0 / 10.0,
        fontFamily: secondaryFont,
        color: color,
      ),
    );
  }
}
