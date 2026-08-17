import 'package:flutter/material.dart';
import 'package:portfolio/src/skills/presentation/widgets/professional_journey/professional_journey.dart';
import 'package:portfolio/src/skills/presentation/widgets/skills_content.dart';

import '../../../../core/shared/design/theme/app_spacings.dart';
import '../../domain/entities/experience_entity.dart';
import '../../domain/entities/graduation_entity.dart';
import '../../domain/entities/skills_entity.dart';

class SkillsAndExperiencesContent extends StatelessWidget {
  const SkillsAndExperiencesContent({
    super.key,
    required this.isMobile,
    required this.skills,
    required this.experiences,
    required this.graduation,
  });

  final bool isMobile;
  final SkillsEntity skills;
  final List<ExperienceEntity> experiences;
  final GraduationEntity graduation;

  @override
  Widget build(BuildContext context) {
    final skillsContent = SkillsContent(
      isMobile: isMobile,
      skills: skills,
      graduation: graduation,
    );
    final professionalJourney = ProfessionalJourney(experiences: experiences);

    if (isMobile) {
      return Column(
        children: [
          skillsContent,
          SizedBox(height: AppSpacing.lg),
          professionalJourney,
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppSpacing.lg,
      children: [
        Expanded(child: skillsContent),
        Expanded(child: professionalJourney),
      ],
    );
  }
}
