import 'package:flutter/material.dart';

import '../theme/app_spacing.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    required this.controller,
    this.label,
    this.hint,
    this.keyboardType,
    this.prefix,
    this.enabled = true,
    this.obscureText = false,
    this.onChanged,
    super.key,
  });

  final TextEditingController controller;
  final String? label;
  final String? hint;
  final TextInputType? keyboardType;
  final Widget? prefix;
  final bool enabled;
  final bool obscureText;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      enabled: enabled,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: prefix != null
            ? Padding(
                padding: const EdgeInsets.only(
                  left: AppSpacing.md,
                  right: AppSpacing.sm,
                ),
                child: prefix,
              )
            : null,
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
      ),
    );
  }
}

class AppDropdownField<T> extends StatelessWidget {
  const AppDropdownField({
    required this.items,
    required this.value,
    required this.onChanged,
    this.label,
    this.hint,
    super.key,
  });

  final List<DropdownMenuItem<T>> items;
  final T? value;
  final ValueChanged<T?> onChanged;
  final String? label;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      items: items,
      onChanged: onChanged,
      decoration: InputDecoration(labelText: label, hintText: hint),
    );
  }
}
