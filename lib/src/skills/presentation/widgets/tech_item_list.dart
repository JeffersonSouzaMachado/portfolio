import 'package:flutter/material.dart';

import '../../../../core/shared/design/theme/app_colors.dart';
import '../../../../core/shared/design/theme/app_spacings.dart';
import '../../../../core/shared/design/theme/app_text.dart';
import '../../domain/entities/tech_skill_entity.dart';

Widget techItemList(TechSkillEntity skill) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: AppSpacing.sm),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Flexible(
              child: AppText(
                skill.skill,
                maxLines: 1,
                color: AppColors.inversePrimary,
                fontSize: 18,
              ),
            ),

            Flexible(
              child: AppText(
                skill.level,
                maxLines: 1,
                color: AppColors.accent,
                fontSize: 18,
              ),
            ),
          ],
        ),
        // Container(height: 1, color: AppColors.accent),
      ],
    ),
  );
}

