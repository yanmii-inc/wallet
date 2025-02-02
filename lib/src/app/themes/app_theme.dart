import 'package:flutter/material.dart';
import 'package:yanmii_wallet/gen/fonts.gen.dart';
import 'package:yanmii_wallet/src/app/themes/foundation/colors.dart';
import 'package:yanmii_wallet/src/app/themes/foundation/typography.dart';

class AppTheme {
  static ColorScheme lightColorScheme = ColorScheme.light(
    primary: LightColors.primaryColor,
    surface: LightColors.neutralColor[1]!,
    onSurface: LightColors.neutralColor[9]!,
    // define more colors
  );

  static ColorScheme darkColorScheme = ColorScheme.dark(
    primary: DarkColors.primaryColor,
    surface: DarkColors.neutralColor[1]!,
    onSurface: DarkColors.neutralColor[9]!,
    // define more colors
  );

  static TextTheme lightTypography = AppTypography(
    colorScheme: lightColorScheme,
    primaryFont: FontFamily.dMSans,
    secondaryFont: FontFamily.dMMono,
    // TODO: define your fonts
  ).toTextTheme();

  static TextTheme darkTypography = AppTypography(
    colorScheme: darkColorScheme,
    primaryFont: FontFamily.dMSans,
    secondaryFont: FontFamily.dMMono,
    // TODO: define your fonts
  ).toTextTheme();

  static final ThemeData light = ThemeData(
    colorScheme: lightColorScheme,
    primaryColor: LightColors.primaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: lightColorScheme.surface,
      elevation: 0,
      titleTextStyle: lightTypography.labelSmall,
    ),
    brightness: Brightness.light,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(color: LightColors.errorColor),
      ),
      errorStyle:
          lightTypography.labelSmall?.copyWith(color: LightColors.errorColor),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: LightColors.primaryColor,
    ),
    extensions: <ThemeExtension<dynamic>>[
      AppColors(
        buttonTextColor: LightColors.neutralColor[9],
        warningColor: LightColors.warningColor,
      ),
      // more themeextensions here
    ],
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (states) {
            if (states.contains(WidgetState.pressed)) {
              return LightColors.primaryColor[7]!;
            } else {
              return LightColors.primaryColor;
            }
          },
        ),
        minimumSize: WidgetStateProperty.resolveWith<Size>(
          (states) => const Size(100, 42),
        ),
        shape: WidgetStateProperty.resolveWith<OutlinedBorder>(
          (states) =>
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    ),
    dialogTheme: const DialogTheme(),
    textTheme: lightTypography,
    // more theme data here
  );

  static final ThemeData dark = ThemeData(
    colorScheme: darkColorScheme,
    primaryColor: DarkColors.primaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: darkColorScheme.surface,
      elevation: 0,
      titleTextStyle: darkTypography.titleSmall,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      isDense: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(color: DarkColors.errorColor),
      ),
    ),
    extensions: <ThemeExtension<dynamic>>[
      AppColors(
        buttonTextColor: LightColors.neutralColor[9],
        warningColor: DarkColors.warningColor,
      ),
    ],
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: DarkColors.primaryColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (states) {
            if (states.contains(WidgetState.pressed)) {
              return DarkColors.primaryColor[7]!;
            } else {
              return DarkColors.primaryColor;
            }
          },
        ),
        minimumSize: WidgetStateProperty.resolveWith<Size>(
          (states) => const Size(100, 42),
        ),
        shape: WidgetStateProperty.resolveWith<OutlinedBorder>(
          (states) =>
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    ),
    dialogTheme: const DialogTheme(),
    textTheme: darkTypography,
    // more theme data here
  );
}

extension ThemeExtended on TextTheme {
  TextStyle get buttonText =>
      labelLarge!.copyWith(color: LightColors.neutralColor[9]);
}
