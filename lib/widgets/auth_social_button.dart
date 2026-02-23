import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/app_radius.dart';
import '../theme/app_spacing.dart';

enum AuthSocialType { google, apple }

class AuthSocialButton extends StatelessWidget {
  const AuthSocialButton({
    required this.type,
    required this.onPressed,
    super.key,
  });

  final AuthSocialType type;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final Color borderColor = Theme.of(
      context,
    ).colorScheme.outline.withOpacity(0.3);

    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(AppRadius.medium),
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppRadius.medium),
          border: Border.all(color: borderColor),
        ),
        padding: const EdgeInsets.all(AppSpacing.xs),
        child: _icon,
      ),
    );
  }

  Widget get _icon {
    switch (type) {
      case AuthSocialType.google:
        return SvgPicture.asset('assets/google.svg', width: 24, height: 24);
      case AuthSocialType.apple:
        return SvgPicture.asset('assets/apple.svg', width: 24, height: 24);
    }
  }
}
