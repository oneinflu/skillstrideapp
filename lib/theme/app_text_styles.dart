import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextTheme textTheme(ColorScheme colorScheme) {
    final displayColor = colorScheme.onBackground;
    final bodyColor = colorScheme.onSurface;

    final displayFont = GoogleFonts.dmSerifDisplay;
    final bodyFont = GoogleFonts.dmSans;

    return TextTheme(
      displayLarge: displayFont(
        fontSize: 48,
        height: 1.2,
        letterSpacing: 0.2,
        color: displayColor,
      ),
      displayMedium: displayFont(
        fontSize: 40,
        height: 1.2,
        letterSpacing: 0.2,
        color: displayColor,
      ),
      displaySmall: displayFont(
        fontSize: 32,
        height: 1.2,
        letterSpacing: 0.1,
        color: displayColor,
      ),
      headlineLarge: displayFont(
        fontSize: 28,
        height: 1.2,
        letterSpacing: 0.1,
        color: displayColor,
      ),
      headlineMedium: displayFont(
        fontSize: 24,
        height: 1.2,
        letterSpacing: 0.1,
        color: displayColor,
      ),
      headlineSmall: displayFont(
        fontSize: 20,
        height: 1.3,
        letterSpacing: 0.1,
        color: displayColor,
      ),
      titleLarge: bodyFont(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: 1.3,
        letterSpacing: 0.1,
        color: bodyColor,
      ),
      titleMedium: bodyFont(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 1.3,
        letterSpacing: 0.1,
        color: bodyColor,
      ),
      titleSmall: bodyFont(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 1.3,
        letterSpacing: 0.1,
        color: bodyColor,
      ),
      bodyLarge: bodyFont(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.5,
        letterSpacing: 0.1,
        color: bodyColor,
      ),
      bodyMedium: bodyFont(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.5,
        letterSpacing: 0.1,
        color: bodyColor,
      ),
      bodySmall: bodyFont(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 1.4,
        letterSpacing: 0.1,
        color: bodyColor,
      ),
      labelLarge: bodyFont(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 1.3,
        letterSpacing: 0.1,
        color: bodyColor,
      ),
      labelMedium: bodyFont(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        height: 1.3,
        letterSpacing: 0.1,
        color: bodyColor,
      ),
      labelSmall: bodyFont(
        fontSize: 10,
        fontWeight: FontWeight.w600,
        height: 1.2,
        letterSpacing: 0.1,
        color: bodyColor,
      ),
    );
  }
}

