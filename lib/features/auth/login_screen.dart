import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

import '../../theme/app_radius.dart';
import '../../theme/app_spacing.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_form_field.dart';
import 'otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  String _dialCode = '+91';
  String _countryCode = 'IN';

  bool get _isPhoneFilled =>
      _phoneController.text.trim().replaceAll(' ', '').length >= 10;

  Future<void> _showCountryPicker() async {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      onSelect: (Country country) {
        setState(() {
          _dialCode = '+${country.phoneCode}';
          _countryCode = country.countryCode;
        });
      },
      countryListTheme: CountryListThemeData(
        bottomSheetHeight: MediaQuery.of(context).size.height * 0.7,
        backgroundColor: Colors.white,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter your mobile number',
              style: textTheme.headlineSmall,
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              '10-Digit mobile number',
              style: textTheme.bodyMedium?.copyWith(
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            Row(
              children: [
                Container(
                  width: 90,
                  height: 52,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(AppRadius.small),
                    border: Border.all(
                      color: Theme.of(context)
                          .colorScheme
                          .outline
                          .withOpacity(0.8),
                      width: 1.2,
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(AppRadius.small),
                    onTap: _showCountryPicker,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.sm,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _dialCode,
                            style: textTheme.bodyMedium,
                          ),
                          const Icon(
                            Icons.keyboard_arrow_down,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: AppTextField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    label: 'Phone number',
                    onChanged: (_) => setState(() {}),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text.rich(
              TextSpan(
                text:
                    "By proceeding you agree with Skillstride academy's ",
                style: textTheme.bodySmall?.copyWith(
                  color: Colors.black54,
                ),
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
              label: 'Get OTP',
              onPressed: () {
                if (!_isPhoneFilled) return;
                final phone = _phoneController.text.trim();
                final fullNumber = '$_dialCode $phone';
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) =>
                        OtpScreen(phoneNumber: fullNumber),
                  ),
                );
              },
              variant: _isPhoneFilled
                  ? AppButtonVariant.secondary
                  : AppButtonVariant.neutral,
            ),
          ],
        ),
      ),
    );
  }
}
