import 'package:flutter/material.dart';
import 'screens/onboarding_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const TrustyApp());
}

class TrustyApp extends StatelessWidget {
  const TrustyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trusty',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        fontFamily: 'Roboto',
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.purpleDark),
      ),
      home: const OnboardingScreen(),
    );
  }
}
