import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/shared/design/theme/app_colors.dart';
import '../../../../core/shared/design/theme/app_spacings.dart';
import '../../../../core/shared/design/theme/app_text.dart';
import '../../../shared/gradient_container.dart';
import '../../domain/entities/graduation_entity.dart';

class GraduationContainer extends StatelessWidget {
  const GraduationContainer({super.key, required this.graduation});

  final GraduationEntity graduation;

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.lg,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Icon(LucideIcons.badgeCheck, color: AppColors.accent),
                SizedBox(width: AppSpacing.md),
                AppText(
                  'Graduation',
                  color: AppColors.inversePrimary,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            SizedBox(height: AppSpacing.md),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  width: 1,
                  color: AppColors.inversePrimary.withValues(alpha: 0.2),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColors.onSecondaryFixedVariant.withValues(
                          alpha: 0.5,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Center(
                        child: Icon(
                          LucideIcons.graduationCap,
                          color: AppColors.inversePrimary,
                        ),
                      ),
                    ),
                    SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          AppText(
                            graduation.course,
                            color: AppColors.inversePrimary,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            maxLines: 2,
                          ),
                          AppText(
                            graduation.institution,
                            color: AppColors.inversePrimary,
                            fontWeight: FontWeight.w400,
                            maxLines: 2,
                          ),
                          AppText(
                            graduation.period,
                            color: AppColors.inversePrimary,
                            fontSize: 14,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
