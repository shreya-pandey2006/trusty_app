import 'package:flutter/material.dart';

/// Centralized colors + text styles so every screen stays consistent.
class AppColors {
  static const Color purpleDark = Color(0xFF8E6CEF);
  static const Color purpleLight = Color(0xFFC9A6F0);
  static const Color pink = Color(0xFFE79BC7);
  static const Color pinkLight = Color(0xFFF3C9E3);
  static const Color background = Color(0xFFF7F3FB);
  static const Color textDark = Color(0xFF2B2140);
  static const Color textGrey = Color(0xFF9C93AC);
  static const Color fieldFill = Color(0xFFF1ECFA);

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [purpleDark, pink],
  );
}

class AppTextStyles {
  static const TextStyle heading = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
    height: 1.2,
  );

  static const TextStyle subheading = TextStyle(
    fontSize: 14,
    color: AppColors.textGrey,
  );

  static const TextStyle label = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.textDark,
  );

  static const TextStyle body = TextStyle(
    fontSize: 14,
    color: AppColors.textDark,
  );
}

/// Reusable gradient "pill" button used on all 3 screens.
class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double height;

  const GradientButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.height = 54,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: AppColors.primaryGradient,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: onPressed,
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
