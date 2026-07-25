import 'package:flutter/material.dart';
import 'package:portfolio/core/shared/design/theme/app_colors.dart';

class GradientCircleBackground extends StatelessWidget {
  const GradientCircleBackground({super.key});

  final double gradientCircleSize = 620;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: gradientCircleSize,
      height: gradientCircleSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          center: Alignment.center,
          radius: 0.5,
          colors: [
            AppColors.primary.withValues(alpha: 0.08),
            AppColors.accent.withValues(alpha: 0.08),
            Colors.transparent,
          ],
          stops: const [0.0, 0.75, 1.0],
        ),
      ),
    );
  }
}
