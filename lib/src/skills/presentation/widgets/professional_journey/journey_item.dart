import 'package:flutter/material.dart';
import 'package:portfolio/core/shared/design/theme/app_colors.dart';
import 'package:portfolio/core/shared/design/theme/app_spacings.dart';
import 'package:portfolio/core/shared/design/theme/app_typography.dart';
import 'package:portfolio/src/skills/domain/entities/experience_entity.dart';
import 'package:portfolio/src/skills/presentation/widgets/professional_journey/journey_header.dart';
import 'package:portfolio/src/skills/presentation/widgets/professional_journey/journey_indicator.dart';
import 'package:portfolio/src/skills/presentation/widgets/professional_journey/journey_tag.dart';

class JourneyItem extends StatelessWidget {
  const JourneyItem({
    super.key,
    required this.experience,
    required this.isLast,
    required this.highlighted,
  });

  final ExperienceEntity experience;
  final bool isLast;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final useVerticalHeader = constraints.maxWidth < 420;

        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              JourneyIndicator(
                isLast: isLast,
                highlighted: highlighted,
              ),
              SizedBox(width: AppSpacing.md),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(bottom: isLast ? 0 : AppSpacing.lg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      JourneyHeader(
                        role: experience.role,
                        period: experience.period,
                        highlighted: highlighted,
                        useVerticalLayout: useVerticalHeader,
                      ),
                      SizedBox(height: AppSpacing.xs),
                      Text(
                        experience.company,
                        style: AppTypography.bodySm.copyWith(
                          color: AppColors.accent,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: AppSpacing.sm),
                      Text(
                        experience.description,
                        style: AppTypography.bodySm.copyWith(
                          color: AppColors.inversePrimary,
                        ),
                      ),
                      SizedBox(height: AppSpacing.md),
                      Wrap(
                        spacing: AppSpacing.sm,
                        runSpacing: AppSpacing.sm,
                        children: experience.tags.map((tag) {
                          return JourneyTag(
                            label: tag,
                            highlighted: highlighted,
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
