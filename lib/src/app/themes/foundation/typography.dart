import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  const AppTypography({
    required this.colorScheme,
  });

  final ColorScheme colorScheme;

  Color get color => colorScheme.onSurface;

  TextStyle get h1 => GoogleFonts.inter(
        fontSize: 24,
        color: color,
      );

  TextStyle get h2 => GoogleFonts.inter(
        fontSize: 18,
        color: color,
      );

  TextStyle get h3 => GoogleFonts.inter(
        fontSize: 16,
        color: color,
      );

  TextStyle get h4 => GoogleFonts.inter(
        fontSize: 14,
        color: color,
      );
  TextStyle get h5 => GoogleFonts.inter(
        fontSize: 12,
        color: color,
      );

  TextStyle get bodyXl => GoogleFonts.inter(
        fontSize: 18,
        color: color,
        height: 18 / 24,
      );

  TextStyle get bodyL => GoogleFonts.inter(
        fontSize: 16,
        color: color,
        height: 16 / 22,
      );

  TextStyle get bodyM => GoogleFonts.inter(
        fontSize: 14,
        color: color,
        height: 14 / 20,
      );

  TextStyle get bodyS => GoogleFonts.inter(
        fontSize: 12,
        color: color,
        height: 12 / 16,
      );

  TextStyle get bodyXs => GoogleFonts.inter(
        fontSize: 10,
        color: color,
        height: 10 / 14,
      );

  TextStyle get actionL => GoogleFonts.inter(
        fontSize: 14,
        color: color,
      );

  TextStyle get actionM => GoogleFonts.inter(
        fontSize: 12,
        color: color,
      );

  TextStyle get actionS => GoogleFonts.inter(
        fontSize: 10,
        color: color,
      );

  TextStyle get captionM => GoogleFonts.inter(
        fontSize: 10,
        color: color,
      );

  TextTheme toTextTheme() {
    return TextTheme(
      displayLarge: GoogleFonts.inter(
        fontSize: 57,
        height: 57 / 64,
        color: color,
      ),
      displayMedium: GoogleFonts.inter(
        fontSize: 46,
        height: 46 / 52,
        color: color,
      ),
      displaySmall: GoogleFonts.inter(
        fontSize: 36,
        height: 36 / 44,
        color: color,
      ),
    );
  }
}
