import 'package:flutter/material.dart';

import '../theme/app_radius.dart';
import '../theme/app_spacing.dart';

enum AppButtonVariant { primary, secondary, neutral }

class AppButton extends StatelessWidget {
  const AppButton({
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.fullWidth = true,
    this.leading,
    super.key,
  });

  final String label;
  final VoidCallback onPressed;
  final AppButtonVariant variant;
  final bool fullWidth;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final bool isPrimary = variant == AppButtonVariant.primary;
    final bool isSecondary = variant == AppButtonVariant.secondary;

    late final Color backgroundColor;
    late final Color foregroundColor;

    if (isPrimary) {
      backgroundColor = colorScheme.onPrimary;
      foregroundColor = colorScheme.primary;
    } else if (isSecondary) {
      backgroundColor = colorScheme.primary;
      foregroundColor = colorScheme.onPrimary;
    } else {
      backgroundColor = colorScheme.surfaceVariant;
      foregroundColor = colorScheme.onSurface;
    }

    final Widget labelWidget = Text(
      label,
      style: textTheme.labelLarge?.copyWith(color: foregroundColor),
    );

    Widget child;
    if (leading != null) {
      child = Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconTheme.merge(
            data: IconThemeData(color: foregroundColor, size: 20),
            child: leading!,
          ),
          const SizedBox(width: AppSpacing.sm),
          labelWidget,
        ],
      );
    } else {
      child = labelWidget;
    }

    final button = ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(0, 52),
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.medium),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.xs,
        ),
      ),
      child: child,
    );

    if (!fullWidth) {
      return button;
    }

    return SizedBox(width: double.infinity, child: button);
  }
}
