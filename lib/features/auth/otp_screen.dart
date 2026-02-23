import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../theme/app_radius.dart';
import '../../theme/app_spacing.dart';
import '../../widgets/app_button.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({required this.phoneNumber, super.key});

  final String phoneNumber;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String _otp = '';

  @override
  void dispose() {
    super.dispose();
  }

  bool get _isOtpComplete => _otp.length == 4;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: textTheme.titleLarge,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppRadius.small),
        border: Border.all(
          color: colorScheme.outline.withOpacity(0.8),
          width: 1.2,
        ),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: colorScheme.primary, width: 1.6),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(''),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('We just sent you an SMS', style: textTheme.headlineSmall),
            const SizedBox(height: AppSpacing.xs),
            Text(
              'Enter the security code we sent to ${widget.phoneNumber}',
              style: textTheme.bodyMedium?.copyWith(color: Colors.black54),
            ),
            const SizedBox(height: AppSpacing.xl),
            Center(
              child: Pinput(
                length: 4,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                mainAxisAlignment: MainAxisAlignment.center,
                onChanged: (value) {
                  setState(() => _otp = value);
                },
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            Center(
              child: Text.rich(
                TextSpan(
                  text: "Didn't receive the code? ",
                  style: textTheme.bodySmall?.copyWith(color: Colors.black54),
                  children: [
                    TextSpan(
                      text: 'RESEND CODE',
                      style: textTheme.bodySmall?.copyWith(
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Text.rich(
              TextSpan(
                text: "By proceeding you agree with Skillstride academy's ",
                style: textTheme.bodySmall?.copyWith(color: Colors.black54),
                children: [
                  TextSpan(
                    text: 'Terms & conditions',
                    style: textTheme.bodySmall?.copyWith(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.md),
            AppButton(
              label: 'Continue',
              onPressed: () {},
              variant: _isOtpComplete
                  ? AppButtonVariant.secondary
                  : AppButtonVariant.neutral,
            ),
          ],
        ),
      ),
    );
  }
}
