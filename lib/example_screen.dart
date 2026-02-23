import 'package:flutter/material.dart';

import 'theme/app_colors.dart';
import 'theme/app_radius.dart';
import 'theme/app_spacing.dart';

class ExampleDesignSystemScreen extends StatelessWidget {
  const ExampleDesignSystemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Design System Preview'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(
                color: AppColors.backgroundWarm,
                borderRadius: BorderRadius.circular(AppRadius.large),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'DM Serif Display Heading',
                    style: textTheme.displaySmall,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    'Primary hero style for key marketing messages or page titles.',
                    style: textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            Text(
              'Typography',
              style: textTheme.headlineMedium,
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              'Headline Medium',
              style: textTheme.headlineMedium,
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              'Headline Small',
              style: textTheme.headlineSmall,
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              'Title Medium',
              style: textTheme.titleMedium,
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              'Body Large text used for primary content blocks across the app.',
              style: textTheme.bodyLarge,
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              'Body Medium for secondary information and descriptions.',
              style: textTheme.bodyMedium,
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              'Label Large',
              style: textTheme.labelLarge,
            ),
            const SizedBox(height: AppSpacing.xl),
            Text(
              'Buttons',
              style: textTheme.headlineMedium,
            ),
            const SizedBox(height: AppSpacing.md),
            Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.sm,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Primary'),
                ),
                ElevatedButton(
                  onPressed: null,
                  child: const Text('Primary Disabled'),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('Secondary'),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Text Button'),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xl),
            Text(
              'Inputs',
              style: textTheme.headlineMedium,
            ),
            const SizedBox(height: AppSpacing.md),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'name@example.com',
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Password',
                hintText: 'Enter password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: AppSpacing.xl),
            Text(
              'Cards',
              style: textTheme.headlineMedium,
            ),
            const SizedBox(height: AppSpacing.md),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(AppSpacing.md),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Primary Card',
                            style: textTheme.titleMedium,
                          ),
                          const SizedBox(height: AppSpacing.xs),
                          Text(
                            'Use cards for grouped content, summaries, and key actions.',
                            style: textTheme.bodyMedium,
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: TextButton(
                              onPressed: () {},
                              child: const Text('Learn more'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.backgroundNeutral,
                      borderRadius: BorderRadius.circular(AppRadius.medium),
                    ),
                    padding: const EdgeInsets.all(AppSpacing.md),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Neutral Surface',
                          style: textTheme.titleMedium,
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        Text(
                          'Neutral surfaces are ideal for dashboards and supporting sections.',
                          style: textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xxl),
          ],
        ),
      ),
    );
  }
}

