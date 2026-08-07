import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/shared/design/theme/app_colors.dart';
import 'package:portfolio/core/shared/design/theme/app_spacings.dart';
import 'package:portfolio/core/shared/design/theme/app_typography.dart';
import 'package:portfolio/src/projects/presentation/providers/project_providers.dart';
import 'package:portfolio/src/projects/presentation/widgets/showcase_app.dart';

import '../../../l10n/app_localizations.dart';
import '../../shared/footer.dart';

class ProjectsPage extends ConsumerWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final language = Localizations.localeOf(context).languageCode;
    final appText = AppLocalizations.of(context)!;

    final project = ref.watch(projectProvider(language));

    return project.when(
      error: (error, stackTrace) {
        return Center(
          child: Text(
            'Erro ao carregar projetos: $error',
          ),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
        data: (projects){
        print('PROJECTS: $projects');

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
                          appText.showcaseHeadTitle,
                          style: AppTypography.headlineLg.copyWith(
                            color: AppColors.accent,
                          ),
                        ),

                        SizedBox(
                          width: 650,
                          child: Text(
                            appText.showcaseHeadText,
                            style: AppTypography.bodyLg.copyWith(
                              color: AppColors.inversePrimary,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 310,
                              mainAxisExtent: 380,
                              crossAxisSpacing: 30,
                              mainAxisSpacing: 30,
                            ),
                            itemCount: projects.length,
                            itemBuilder: (context, index) {
                              return ShowCaseApp(project: projects[index]);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              LayoutBuilder(
                builder: (context, constraints) {
                  final isMobile = constraints.maxWidth < 550;

                  return Footer(isMobile: isMobile);
                },
              ),
            ],
          );
        },


    );

  }
}
