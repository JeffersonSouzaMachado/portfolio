import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:portfolio/core/shared/design/theme/app_colors.dart';
import 'package:portfolio/core/shared/design/theme/app_typography.dart';
import 'package:portfolio/l10n/app_localizations.dart';
import 'package:portfolio/src/projects/presentation/mappers/project_asset_mapper.dart';
import 'package:portfolio/src/projects/presentation/widgets/app_mockup.dart';
import 'package:portfolio/src/projects/presentation/widgets/dynamic_container.dart';
import 'package:portfolio/src/projects/presentation/widgets/section_header.dart';
import 'package:portfolio/src/projects/presentation/widgets/tech_stack_container.dart';

import 'package:portfolio/src/shared/footer.dart';

import '../data/models/project_model.dart';

class Project extends StatelessWidget {
  const Project({super.key, required this.project});

  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    final appText = AppLocalizations.of(context)!;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 550;

        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: isMobile ? 240 : null,
                      child: Image.asset(
                        ProjectAssetMapper.image(project.cardImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: isMobile ? 160 : 420,
                      left: 0,
                      right: 0,
                      child: Container(
                        width: double.infinity,
                        height: isMobile ? 100 : 200,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, AppColors.primary],
                            stops: const [0.0, 0.5],
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      top: isMobile ? 170 : 500,
                      left: 20,
                      right: 20,
                      child: Text(
                        project.companyFullName,
                        maxLines: 2,
                        style: isMobile
                            ? AppTypography.headlineLgMobile.copyWith(
                                color: AppColors.tertiaryContainer,
                              )
                            : AppTypography.headlineLg.copyWith(
                                color: AppColors.tertiaryContainer,
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Text(
                      project.companyDescription,
                      style: AppTypography.bodyMd.copyWith(
                        color: AppColors.inversePrimary,
                      ),
                    ),
                  ],
                ),
              ),

              if (isMobile)
                mobile(
                  sectionTitle: appText.appOverview,
                  project: project,
                  appText: appText,
                )
              else
                desktop(appText: appText, project: project),

              Footer(isMobile: isMobile,),
            ],
          ),
        );
      },
    );
  }
}

Widget mobile({
  required String sectionTitle,
  required ProjectModel project,
  required AppLocalizations appText,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
    child: Column(
      children: [
        ...sectionHeader(
          title: sectionTitle,
          text: project.appOverview,
          icon: Icons.info_outline_rounded,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: TechStackContainer(stack: project.techStack, isMobile: true),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: .start,
            spacing: 30,
            children: [
              DynamicContainer(
                height: 190,
                icon: LucideIcons.puzzle,
                title: appText.appChallenge,
                text: project.appChallenge,
              ),

              DynamicContainer(
                height: 190,
                icon: LucideIcons.wandSparkles,
                title: appText.appSolution,
                text: project.appSolution,
              ),
            ],
          ),
        ),
        AppMockups(
          headTitle: appText.projectMockups,
          icon: LucideIcons.images,
          appMockupsList: project.appMockups,
        ),
      ],
    ),
  );
}

Widget desktop({
  required AppLocalizations appText,
  required ProjectModel project,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 25),
    child: Row(
      crossAxisAlignment: .start,

      children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: .start,
            children: [
              ...sectionHeader(
                title: appText.appOverview,
                text: project.appOverview,
                icon: Icons.info_outline_rounded,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0, right: 30, top: 30),
                child: Row(
                  mainAxisAlignment: .center,spacing: 30,
                  children: [
                    Expanded(
                      child: DynamicContainer(
                        height: 190,
                        icon: LucideIcons.puzzle,
                        title: appText.appChallenge,
                        text: project.appChallenge,
                      ),
                    ),

                    Expanded(
                      child: DynamicContainer(

                        height: 190,
                        icon: LucideIcons.wandSparkles,
                        title: appText.appSolution,
                        text: project.appSolution,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: AppMockups(
                  headTitle: appText.projectMockups,
                  icon: LucideIcons.images,
                  appMockupsList: project.appMockups,
                ),
              ),
            ],
          ),
        ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: TechStackContainer(stack: project.techStack),
          ),
        ),

      ],
    ),
  );
}
