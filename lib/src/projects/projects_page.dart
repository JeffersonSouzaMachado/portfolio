import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/shared/const/temp_data_list.dart';
import 'package:portfolio/core/shared/design/theme/app_colors.dart';
import 'package:portfolio/core/shared/design/theme/app_spacings.dart';
import 'package:portfolio/core/shared/design/theme/app_typography.dart';
import 'package:portfolio/src/projects/widgets/project_model.dart';

import '../../l10n/app_localizations.dart';
import '../shared/footer.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appText = AppLocalizations.of(context)!;

    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppSpacing.lg,
              horizontal: AppSpacing.xl,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20,
                children: [
                  Text(
                    'Engineering Excelence',
                    style: AppTypography.headlineLg.copyWith(
                      color: AppColors.accent,
                    ),
                  ),

                  SizedBox(
                    width: 650,
                    child: Text(
                      'A curated showcase of high-performance mobile applications, ranging from fintech solutions to real-time communication platforms.'
                      ' Built with precision and optimized for the modern edge.',
                      style: AppTypography.bodyLg.copyWith(
                        color: AppColors.inversePrimary,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: SizedBox(
                      width: double.infinity,
                      height: 800,
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 310,
                              mainAxisExtent: 380,
                              crossAxisSpacing: 30,
                              mainAxisSpacing: 30,
                            ),
                        itemCount: getDataProject(appText).length,
                        itemBuilder: (context, index) {
                          return ShowCaseApp(
                            project: getDataProject(appText)[index],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Footer(),
      ],
    );
  }
}

class ShowCaseApp extends StatelessWidget {
  const ShowCaseApp({super.key, required this.project});

  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.go('/project', extra: project);
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryContainer,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.accent.withValues(alpha: 0.1)),
        ),
        child: Column(
          spacing: 15,
          mainAxisAlignment: .start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Image.asset(project.cardImage),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                project.companyName,
                style: AppTypography.labelMd.copyWith(
                  color: AppColors.accent,
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                project.shortDescription,
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
                style: AppTypography.bodySm.copyWith(
                  color: AppColors.inversePrimary,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: .end,
                children: [
                  Text(
                    'Ver mais',
                    style: AppTypography.bodyMd.copyWith(
                      color: AppColors.accent,
                    ),
                  ),
                  Icon(Icons.arrow_forward, color: AppColors.accent),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
