import 'package:flutter/material.dart';
import 'package:portfolio/core/shared/design/theme/app_colors.dart';
import 'package:portfolio/core/shared/design/theme/app_spacings.dart';
import 'package:portfolio/core/shared/design/theme/app_typography.dart';

class JourneyHeader extends StatelessWidget {
  const JourneyHeader({
    super.key,
    required this.role,
    required this.period,
    required this.highlighted,
    required this.useVerticalLayout,
  });

  final String role;
  final String period;
  final bool highlighted;
  final bool useVerticalLayout;

  @override
  Widget build(BuildContext context) {
    final roleText = Text(
      role,
      style: AppTypography.bodyMd.copyWith(
        color: highlighted ? AppColors.onSecondary : AppColors.inversePrimary,
        fontWeight: FontWeight.w600,
      ),
    );
    final periodText = Text(
      period,
      style: AppTypography.labelSm.copyWith(
        color: highlighted ? AppColors.accent : AppColors.inversePrimary,
      ),
    );

    if (useVerticalLayout) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          roleText,
          SizedBox(height: AppSpacing.xs),
          periodText,
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: roleText),
        SizedBox(width: AppSpacing.md),
        periodText,
      ],
    );
  }
}
