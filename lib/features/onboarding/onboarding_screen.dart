import 'package:flutter/material.dart';

import '../../theme/app_spacing.dart';
import '../auth/auth_entry_screen.dart';
import '../../widgets/app_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  final List<_OnboardingSlide> _slides = const [
    _OnboardingSlide(
      imageAsset: 'assets/onboarding1.jpg',
      title: 'Your Hub for Digital Marketing',
      subtitle: '& Multimedia Mastery!',
    ),
    _OnboardingSlide(
      imageAsset: 'assets/onboarding2.jpg',
      title: 'Trusted by 10,000+ students',
      subtitle: 'across Worldwide',
    ),
    _OnboardingSlide(
      imageAsset: 'assets/onboarding3.jpg',
      title: 'Learn directly from',
      subtitle: 'Professionals',
    ),
  ];

  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goNext() {
    if (_currentIndex < _slides.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOutCubic,
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const AuthEntryScreen(mode: AuthEntryMode.signup),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _slides.length,
                onPageChanged: (index) {
                  setState(() => _currentIndex = index);
                },
                itemBuilder: (context, index) {
                  return AnimatedBuilder(
                    animation: _pageController,
                    builder: (context, child) {
                      double page = _currentIndex.toDouble();
                      if (_pageController.hasClients &&
                          _pageController.position.haveDimensions) {
                        page = _pageController.page ?? page;
                      }
                      final distance = (page - index).clamp(-1.0, 1.0);
                      final opacity = (1.0 - distance.abs() * 0.4).clamp(
                        0.0,
                        1.0,
                      );
                      final scale = 1.0 - distance.abs() * 0.05;
                      final horizontalOffset = 24.0 * distance;

                      return Opacity(
                        opacity: opacity,
                        child: Transform.translate(
                          offset: Offset(horizontalOffset, 0),
                          child: Transform.scale(scale: scale, child: child),
                        ),
                      );
                    },
                    child: _OnboardingSlideView(
                      slide: _slides[index],
                      textTheme: textTheme,
                      totalSlides: _slides.length,
                      activeIndex: _currentIndex,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.lg,
                0,
                AppSpacing.lg,
                AppSpacing.xl,
              ),
              child: AppButton(
                label: 'Continue',
                onPressed: _goNext,
                variant: AppButtonVariant.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardingSlideView extends StatelessWidget {
  const _OnboardingSlideView({
    required this.slide,
    required this.textTheme,
    required this.totalSlides,
    required this.activeIndex,
  });

  final _OnboardingSlide slide;
  final TextTheme textTheme;
  final int totalSlides;
  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(slide.imageAsset, fit: BoxFit.cover),
        ),
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.9)],
                stops: const [0.55, 1],
              ),
            ),
          ),
        ),
        Positioned(
          top: AppSpacing.sm,
          left: AppSpacing.lg,
          child: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.lg,
              0,
              AppSpacing.lg,
              140,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  slide.title,
                  textAlign: TextAlign.center,
                  style: textTheme.titleLarge?.copyWith(color: Colors.white),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  slide.subtitle,
                  textAlign: TextAlign.center,
                  style: textTheme.titleMedium?.copyWith(color: Colors.white),
                ),
                const SizedBox(height: AppSpacing.lg),
                _OnboardingPills(length: totalSlides, activeIndex: activeIndex),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _OnboardingSlide {
  const _OnboardingSlide({
    required this.imageAsset,
    required this.title,
    required this.subtitle,
  });

  final String imageAsset;
  final String title;
  final String subtitle;
}

class _OnboardingPills extends StatelessWidget {
  const _OnboardingPills({required this.length, required this.activeIndex});

  final int length;
  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(length, (index) {
        final bool isActive = index == activeIndex;
        return Container(
          width: 10,
          height: 10,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: isActive ? Colors.white : Colors.transparent,
            border: Border.all(color: Colors.white, width: 1.4),
          ),
        );
      }),
    );
  }
}
