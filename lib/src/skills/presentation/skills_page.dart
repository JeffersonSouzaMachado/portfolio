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
import 'package:portfolio/src/skills/presentation/providers/skills_providers.dart';
import 'package:portfolio/src/skills/presentation/widgets/skills_experience_content.dart';

class SkillsPage extends ConsumerWidget {
  const SkillsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appText = AppLocalizations.of(context)!;
    final language = Localizations.localeOf(context).languageCode;
    final skills = ref.watch(skillsProvider(language));
    final experiences = ref.watch(experiencesProvider(language));
    final graduation = ref.watch(graduationProvider(language));

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 550;
        final horizontalPadding = isMobile
            ? AppSpacing.mobileMargin
            : AppSpacing.xl;

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
                          style:
                              (isMobile
                                      ? AppTypography.headlineXlMobile
                                      : AppTypography.headlineXl)
                                  .copyWith(color: AppColors.inversePrimary),
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
                                return graduation.when(
                                  error: (error, stackTrace) {
                                    return ErrorMessage(error: error);
                                  },
                                  loading: () {
                                    return LoadingMessage();
                                  },
                                  data: (graduation) {
                                    return SkillsAndExperiencesContent(
                                      isMobile: isMobile,
                                      skills: skills,
                                      experiences: experiences,
                                      graduation: graduation,
                                    );
                                  },
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
            Footer(isMobile: isMobile),
          ],
        );
      },
    );
  }
}
