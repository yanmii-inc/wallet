import 'package:flutter/material.dart';
import 'package:yanmii_wallet/src/app/constants/constants.dart';

class AppTheme {
  static const lightColors = ColorScheme.light();

  static const darkColors = ColorScheme.dark();

  static const lightTypography = AppTypography(colorScheme: lightColors);

  static const darkTypography = AppTypography(colorScheme: darkColors);

  static final ThemeData defaultTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 16,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    ),
    textTheme: lightTypography.toTextTheme(),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.disabled)) {
            return LightColors.neutralColor;
          }
          if (states.contains(WidgetState.hovered)) {
            return LightColors.primaryColor.shade400;
          } else if (states.contains(WidgetState.focused)) {
            return LightColors.primaryColor.shade400;
          }
          return LightColors.primaryColor;
        }),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 16,
      ),
      border: OutlineInputBorder(),
    ),
    textTheme: darkTypography.toTextTheme(),
  );
}
