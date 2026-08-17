import 'package:flutter/material.dart';

import '../../../../core/shared/design/theme/app_colors.dart';
import '../../../../core/shared/design/theme/app_spacings.dart';
import '../../../../core/shared/design/theme/app_typography.dart';
import '../../../shared/gradient_container.dart';

Widget experienceWidget({
  required IconData icon,
  required String title,
  required String text,
}) {
  return GradientContainer(
    height: 200,
    width: double.infinity,
    child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        // vertical: AppSpacing.sm,
      ),
      child: Column(
        mainAxisAlignment: .center,
        crossAxisAlignment: .start,
        spacing: 10,
        children: [
          Icon(icon, color: AppColors.accent),
          Flexible(
            child: Text(
              title,
              style: AppTypography.bodyMd.copyWith(
                color: AppColors.inversePrimary,
              ),
            ),
          ),
          Flexible(
            child: Text(
              text,
              style: AppTypography.bodySm.copyWith(
                color: AppColors.inversePrimary,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
