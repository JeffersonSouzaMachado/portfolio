import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/shared/design/theme/app_colors.dart';
import 'package:portfolio/core/shared/design/theme/app_spacings.dart';
import 'package:portfolio/core/shared/design/theme/app_text.dart';
import 'package:portfolio/core/shared/design/theme/app_typography.dart';
import 'package:portfolio/l10n/app_localizations.dart';
import 'package:portfolio/src/shared/footer.dart';
import 'package:portfolio/src/shared/error_message.dart';
import 'package:portfolio/src/shared/loading_message.dart';
import 'package:portfolio/src/skills/domain/entities/experience_entity.dart';
import 'package:portfolio/src/skills/domain/entities/skills_entity.dart';
import 'package:portfolio/src/skills/presentation/providers/skills_providers.dart';
import 'package:portfolio/src/skills/presentation/widgets/experience_widget.dart';
import 'package:portfolio/src/skills/presentation/widgets/professional_journey/professional_journey.dart';
import 'package:portfolio/src/skills/presentation/widgets/tech_skills.dart';

class SkillsPage extends ConsumerWidget {
  const SkillsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appText = AppLocalizations.of(context)!;
    final language = Localizations.localeOf(context).languageCode;
    final skills = ref.watch(skillsProvider(language));
    final experiences = ref.watch(experiencesProvider(language));

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 550;
        final horizontalPadding =
            isMobile ? AppSpacing.mobileMargin : AppSpacing.xl;

        return Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: AppSpacing.lg),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: horizontalPadding,
                        ),
                        child: Text(
                          appText.skillsPageTitle,
                          style: (isMobile
                                  ? AppTypography.headlineXlMobile
                                  : AppTypography.headlineXl)
                              .copyWith(
                            color: AppColors.inversePrimary,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: horizontalPadding,
                          vertical: AppSpacing.md,
                        ),
                        child: SizedBox(
                          width: 700,
                          child: AppText(
                            appText.skillsPageDescription,
                            color: AppColors.inversePrimary,
                          ),
                        ),
                      ),
                      SizedBox(height: AppSpacing.xl),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: horizontalPadding,
                        ),
                        child: skills.when(
                          error: (error, stackTrace) {
                            return ErrorMessage(error: error);
                          },
                          loading: () {
                            return LoadingMessage();
                          },
                          data: (skills) {
                            return experiences.when(
                              error: (error, stackTrace) {
                                return ErrorMessage(error: error);
                              },
                              loading: () {
                                return LoadingMessage();
                              },
                              data: (experiences) {
                                return _SkillsAndExperiencesContent(
                                  isMobile: isMobile,
                                  skills: skills,
                                  experiences: experiences,
                                );
                              },
                            );
                          },
                        ),
                      ),
                      SizedBox(height: AppSpacing.xxl),
                    ],
                  ),
                ),
              ),
            ),
            Footer(isMobile: isMobile,),
          ],
        );
      },
    );
  }
}

class _SkillsAndExperiencesContent extends StatelessWidget {
  const _SkillsAndExperiencesContent({
    required this.isMobile,
    required this.skills,
    required this.experiences,
  });

  final bool isMobile;
  final SkillsEntity skills;
  final List<ExperienceEntity> experiences;

  @override
  Widget build(BuildContext context) {
    final skillsContent = _SkillsContent(
      isMobile: isMobile,
      skills: skills,
    );
    final professionalJourney = ProfessionalJourney(
      experiences: experiences,
    );

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

class _SkillsContent extends StatelessWidget {
  const _SkillsContent({
    required this.isMobile,
    required this.skills,
  });

  final bool isMobile;
  final SkillsEntity skills;

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
