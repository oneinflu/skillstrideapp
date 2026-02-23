import 'package:flutter/material.dart';

import '../features/onboarding/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await Future.delayed(const Duration(seconds: 2));
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const WelcomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth * 1;
            final height = constraints.maxHeight * 1;

            return TweenAnimationBuilder<double>(
              tween: Tween(begin: -0.3, end: 0),
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeOutCubic,
              builder: (context, value, child) {
                return Transform.translate(
                  offset: Offset(0, height * value),
                  child: Opacity(
                    opacity: (1 + value * 3).clamp(0.0, 1.0),
                    child: child,
                  ),
                );
              },
              child: SizedBox(
                width: width,
                height: height,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/pen.png',
                      width: width,
                      fit: BoxFit.contain,
                    ),
                    Image.asset(
                      'assets/logo.png',
                      width: width * 0.4,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
