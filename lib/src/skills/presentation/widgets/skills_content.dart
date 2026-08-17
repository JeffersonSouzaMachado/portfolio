import 'package:flutter/material.dart';
import 'package:portfolio/src/skills/presentation/widgets/graduation_container.dart';
import 'package:portfolio/src/skills/presentation/widgets/tech_skills.dart';

import '../../../../core/shared/design/theme/app_spacings.dart';
import '../../domain/entities/graduation_entity.dart';
import '../../domain/entities/skills_entity.dart';
import 'experience_widget.dart';

class SkillsContent extends StatelessWidget {
  const SkillsContent({
    super.key,
    required this.isMobile,
    required this.skills,
    required this.graduation,
  });

  final bool isMobile;
  final SkillsEntity skills;
  final GraduationEntity graduation;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = _strongSkillCardWidth(constraints);

        return Column(
          children: [
            Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.md,
              children: skills.strongestSkills.map((item) {
                return SizedBox(
                  width: cardWidth,
                  child: experienceWidget(
                    icon: item.icon,
                    title: item.title,
                    text: item.text,
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: AppSpacing.lg),
            techSkills(
              context: context,
              techSkillList: skills.techSkills,
              secondarySkills: skills.secondarySkills,
            ),
            SizedBox(height: AppSpacing.lg),
            GraduationContainer(graduation: graduation),
          ],
        );
      },
    );
  }

  double _strongSkillCardWidth(BoxConstraints constraints) {
    if (!constraints.hasBoundedWidth) {
      return 220;
    }

    if (isMobile || constraints.maxWidth < 456) {
      return constraints.maxWidth;
    }

    return (constraints.maxWidth - AppSpacing.md) / 2;
  }
}
