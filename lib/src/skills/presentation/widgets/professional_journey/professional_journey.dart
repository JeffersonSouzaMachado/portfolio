import 'package:flutter/material.dart';
import 'package:portfolio/core/shared/design/theme/app_colors.dart';
import 'package:portfolio/core/shared/design/theme/app_spacings.dart';
import 'package:portfolio/core/shared/design/theme/app_text.dart';
import 'package:portfolio/l10n/app_localizations.dart';
import 'package:portfolio/src/shared/gradient_container.dart';
import 'package:portfolio/src/skills/domain/entities/experience_entity.dart';
import 'package:portfolio/src/skills/presentation/widgets/professional_journey/journey_item.dart';

class ProfessionalJourney extends StatelessWidget {
  const ProfessionalJourney({
    super.key,
    required this.experiences,
  });

  final List<ExperienceEntity> experiences;

  @override
  Widget build(BuildContext context) {
    final appText = AppLocalizations.of(context)!;

    return GradientContainer(
      child: Padding(
        padding: EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              appText.professionalJourney,
              color: AppColors.inversePrimary,
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: AppSpacing.lg),
            ...List.generate(experiences.length, (index) {
              return JourneyItem(
                experience: experiences[index],
                highlighted: index == 0,
                isLast: index == experiences.length - 1,
              );
            }),
          ],
        ),
      ),
    );
  }
}
