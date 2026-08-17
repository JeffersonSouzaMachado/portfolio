import 'package:flutter/material.dart';
import 'package:portfolio/l10n/app_localizations.dart';
import 'package:portfolio/src/skills/presentation/widgets/professional_journey/journey_tag.dart';
import 'package:portfolio/src/skills/presentation/widgets/tech_item_list.dart';

import '../../../../core/shared/design/theme/app_colors.dart';
import '../../../../core/shared/design/theme/app_spacings.dart';
import '../../../../core/shared/design/theme/app_text.dart';
import '../../../shared/gradient_container.dart';
import '../../domain/entities/tech_skill_entity.dart';

Widget techSkills({
  required BuildContext context,
  required List<TechSkillEntity> techSkillList,
  required List<String> secondarySkills,
}) {
  final appText = AppLocalizations.of(context)!;

  return GradientContainer(
    child: Padding(
      padding: EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          AppText(
            appText.technicalProwess,
            color: AppColors.inversePrimary,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: AppSpacing.md),
          ...techSkillList.map((item) => techItemList(item)),
          SizedBox(height: AppSpacing.md),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: secondarySkills.map((item) {
              return JourneyTag(label: item, highlighted: false);
            }).toList(),
          ),
        ],
      ),
    ),
  );
}
