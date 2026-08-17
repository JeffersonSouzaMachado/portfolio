import 'package:flutter/material.dart';
import 'package:portfolio/core/shared/design/theme/app_colors.dart';
import 'package:portfolio/core/shared/design/theme/app_radius.dart';
import 'package:portfolio/core/shared/design/theme/app_spacings.dart';
import 'package:portfolio/core/shared/design/theme/app_typography.dart';

class JourneyTag extends StatelessWidget {
  const JourneyTag({
    super.key,
    required this.label,
    required this.highlighted,
  });

  final String label;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: highlighted
            ? AppColors.accent.withValues(alpha: 0.18)
            : AppColors.onSecondaryFixed,
        borderRadius: AppRadius.borderRegular,
        border: Border.all(
          color: highlighted
              ? AppColors.accent.withValues(alpha: 0.35)
              : AppColors.onPrimary.withValues(alpha: 0.05),
        ),
      ),
      child: Text(
        label,
        style: AppTypography.labelSm.copyWith(
          color: highlighted ? AppColors.onSecondary : AppColors.inversePrimary,
        ),
      ),
    );
  }
}
