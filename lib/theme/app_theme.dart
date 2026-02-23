import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_radius.dart';
import 'app_spacing.dart';
import 'app_text_styles.dart';

class AppTheme {
  AppTheme._();

  static ThemeData light() {
    const colorScheme = AppColors.lightColorScheme;

    final base = ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.background,
      textTheme: AppTextStyles.textTheme(colorScheme),
    );

    return base.copyWith(
      appBarTheme: _appBarTheme(base),
      elevatedButtonTheme: _elevatedButtonTheme(colorScheme),
      outlinedButtonTheme: _outlinedButtonTheme(colorScheme),
      textButtonTheme: _textButtonTheme(colorScheme),
      inputDecorationTheme: _inputDecorationTheme(colorScheme),
      cardTheme: _cardTheme(colorScheme),
    );
  }

  static ThemeData dark() {
    const lightScheme = AppColors.lightColorScheme;
    final darkScheme = AppColors.darkColorSchemeFrom(lightScheme);

    final base = ThemeData(
      useMaterial3: true,
      colorScheme: darkScheme,
      scaffoldBackgroundColor: darkScheme.background,
      textTheme: AppTextStyles.textTheme(darkScheme),
    );

    return base.copyWith(
      appBarTheme: _appBarTheme(base),
      elevatedButtonTheme: _elevatedButtonTheme(darkScheme),
      outlinedButtonTheme: _outlinedButtonTheme(darkScheme),
      textButtonTheme: _textButtonTheme(darkScheme),
      inputDecorationTheme: _inputDecorationTheme(darkScheme),
      cardTheme: _cardTheme(darkScheme),
    );
  }

  static AppBarTheme _appBarTheme(ThemeData base) {
    final colorScheme = base.colorScheme;
    return AppBarTheme(
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
      centerTitle: false,
      elevation: 0,
      scrolledUnderElevation: 0,
      titleTextStyle: base.textTheme.titleLarge?.copyWith(
        color: colorScheme.onPrimary,
      ),
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
    );
  }

  static ElevatedButtonThemeData _elevatedButtonTheme(ColorScheme colorScheme) {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(const Size(64, 48)),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.xs,
          ),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.medium),
          ),
        ),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColors.disabled;
          }
          if (states.contains(WidgetState.pressed)) {
            return colorScheme.primaryContainer;
          }
          return colorScheme.primary;
        }),
        foregroundColor: WidgetStateProperty.all(colorScheme.onPrimary),
        textStyle: WidgetStateProperty.all(
          AppTextStyles.textTheme(colorScheme).labelLarge,
        ),
      ),
    );
  }

  static OutlinedButtonThemeData _outlinedButtonTheme(ColorScheme colorScheme) {
    return OutlinedButtonThemeData(
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(const Size(64, 48)),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.xs,
          ),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.medium),
          ),
        ),
        side: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return BorderSide(color: AppColors.disabled);
          }
          return BorderSide(color: colorScheme.primary);
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColors.disabled;
          }
          return colorScheme.primary;
        }),
        textStyle: WidgetStateProperty.all(
          AppTextStyles.textTheme(colorScheme).labelLarge,
        ),
      ),
    );
  }

  static TextButtonThemeData _textButtonTheme(ColorScheme colorScheme) {
    return TextButtonThemeData(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.xs,
          ),
        ),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColors.disabled;
          }
          if (states.contains(WidgetState.pressed)) {
            return colorScheme.primaryContainer;
          }
          return colorScheme.primary;
        }),
        textStyle: WidgetStateProperty.all(
          AppTextStyles.textTheme(colorScheme).labelLarge,
        ),
      ),
    );
  }

  static InputDecorationTheme _inputDecorationTheme(ColorScheme colorScheme) {
    OutlineInputBorder border(Color color) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.small),
        borderSide: BorderSide(color: color, width: 1.2),
      );
    }

    return InputDecorationTheme(
      filled: true,
      fillColor: colorScheme.surface,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      border: border(colorScheme.outline),
      enabledBorder: border(colorScheme.outline),
      focusedBorder: border(colorScheme.primary),
      errorBorder: border(colorScheme.error),
      focusedErrorBorder: border(colorScheme.error),
      labelStyle: AppTextStyles.textTheme(
        colorScheme,
      ).bodyMedium?.copyWith(color: colorScheme.onSurface.withOpacity(0.7)),
      hintStyle: AppTextStyles.textTheme(
        colorScheme,
      ).bodyMedium?.copyWith(color: colorScheme.onSurface.withOpacity(0.5)),
    );
  }

  static CardThemeData _cardTheme(ColorScheme colorScheme) {
    return CardThemeData(
      color: colorScheme.surface,
      elevation: 0,
      margin: const EdgeInsets.all(AppSpacing.md),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.medium),
        side: BorderSide(color: colorScheme.outline.withOpacity(0.3)),
      ),
    );
  }
}
