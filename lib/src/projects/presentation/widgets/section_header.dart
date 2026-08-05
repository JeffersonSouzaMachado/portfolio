import 'package:flutter/material.dart';
import 'package:portfolio/core/shared/design/theme/app_typography.dart';

import '../../../../core/shared/design/theme/app_colors.dart';


List<Widget> sectionHeader({
  required String title,
  String? text,
  required IconData icon,
}) {
  return [
    Row(
      spacing: 10,
      children: [
        Icon(icon, color: AppColors.accent),
        Text(
          title,
          style: AppTypography.headlineLgMobile.copyWith(
            color: AppColors.inversePrimary,
          ),
        ),
      ],
    ),
    SizedBox(height: 20),
    if (text != null)
      Padding(
        padding: const EdgeInsets.only(right: 30),
        child: Text(
          text,
          style: AppTypography.bodySm.copyWith(color: AppColors.inversePrimary),
        ),
      ),
  ];
}