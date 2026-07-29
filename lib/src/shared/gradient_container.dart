import 'package:flutter/material.dart';
import 'package:portfolio/core/shared/design/theme/app_colors.dart';

import '../../core/shared/design/theme/app_radius.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({
    super.key,
    required this.child,
    this.isCircle = false,
    this.width = 50,
    this.height = 50,
  });

  final Widget child;
  final bool isCircle;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.onTertiary,
        gradient: RadialGradient(
          center: Alignment.topRight,
          colors: [
            AppColors.onTertiary,
            AppColors.onTertiaryContainer.withValues(alpha: 0.5),
          ],
        ),
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: isCircle ? null : AppRadius.borderRegular,
        border: Border.all(color: AppColors.onPrimary.withValues(alpha: 0.05)),
      ),
      child: child,
    );
  }
}
