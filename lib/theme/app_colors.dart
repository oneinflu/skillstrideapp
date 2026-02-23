import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primary = Color(0xFF1A3654);
  static const Color primaryVariant = Color(0xFF206582);

  static const Color backgroundWarm = Color(0xFFFFDDB8);
  static const Color backgroundSoft = Color(0xFFFFF2E5);
  static const Color backgroundNeutral = Color(0xFFF1F1F1);
  static const Color surface = Color(0xFFFFFFFF);

  static const Color textPrimary = Color(0xFF000000);
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  static const Color borderSubtle = Color(0x33000000);
  static const Color borderStrong = Color(0x66000000);

  static const Color disabled = Color(0xFFB0B0B0);
  static const Color error = Colors.red;

  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: primary,
    onPrimary: textOnPrimary,
    primaryContainer: primaryVariant,
    onPrimaryContainer: textOnPrimary,
    secondary: primaryVariant,
    onSecondary: textOnPrimary,
    secondaryContainer: backgroundWarm,
    onSecondaryContainer: textPrimary,
    tertiary: backgroundWarm,
    onTertiary: textPrimary,
    tertiaryContainer: backgroundSoft,
    onTertiaryContainer: textPrimary,
    error: error,
    onError: textOnPrimary,
    errorContainer: Color(0xFFFFE5E5),
    onErrorContainer: textPrimary,
    background: backgroundSoft,
    onBackground: textPrimary,
    surface: surface,
    onSurface: textPrimary,
    surfaceVariant: backgroundNeutral,
    onSurfaceVariant: textPrimary,
    outline: borderSubtle,
    outlineVariant: borderStrong,
    shadow: Colors.black,
    scrim: Colors.black54,
    inverseSurface: primary,
    onInverseSurface: textOnPrimary,
    inversePrimary: primaryVariant,
    surfaceTint: primary,
  );

  static ColorScheme darkColorSchemeFrom(ColorScheme base) {
    return ColorScheme(
      brightness: Brightness.dark,
      primary: base.primary,
      onPrimary: base.onPrimary,
      primaryContainer: base.primaryContainer,
      onPrimaryContainer: base.onPrimaryContainer,
      secondary: base.secondary,
      onSecondary: base.onSecondary,
      secondaryContainer: base.secondaryContainer,
      onSecondaryContainer: base.onSecondaryContainer,
      tertiary: base.tertiary,
      onTertiary: base.onTertiary,
      tertiaryContainer: base.tertiaryContainer,
      onTertiaryContainer: base.onTertiaryContainer,
      error: base.error,
      onError: base.onError,
      errorContainer: base.errorContainer,
      onErrorContainer: base.onErrorContainer,
      background: Colors.black,
      onBackground: Colors.white,
      surface: const Color(0xFF121212),
      onSurface: Colors.white,
      surfaceVariant: const Color(0xFF1E1E1E),
      onSurfaceVariant: Colors.white70,
      outline: base.outline,
      outlineVariant: base.outlineVariant,
      shadow: base.shadow,
      scrim: base.scrim,
      inverseSurface: base.inverseSurface,
      onInverseSurface: base.onInverseSurface,
      inversePrimary: base.inversePrimary,
      surfaceTint: base.surfaceTint,
    );
  }
}

