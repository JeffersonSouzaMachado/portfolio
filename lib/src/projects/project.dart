import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:portfolio/core/shared/design/icons/images_app.dart';
import 'package:portfolio/core/shared/design/theme/app_colors.dart';
import 'package:portfolio/core/shared/design/theme/app_typography.dart';
import 'package:portfolio/l10n/app_localizations.dart';
import 'package:portfolio/src/projects/widgets/app_mockup.dart';
import 'package:portfolio/src/projects/widgets/dynamic_container.dart';
import 'package:portfolio/src/projects/widgets/project_model.dart';
import 'package:portfolio/src/projects/widgets/section_header.dart';
import 'package:portfolio/src/projects/widgets/tech_stack_container.dart';
import 'package:portfolio/src/shared/footer.dart';

class Project extends StatelessWidget {
  const Project({super.key, required this.project});

  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    final appText = AppLocalizations.of(context)!;

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  SizedBox(
                    height: 500,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Image.asset(
                            ImagesApp.helpneiMainLogo,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 300,
                          left: 0,
                          right: 0,
                          child: Container(
                            width: double.infinity,
                            height: 300,
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
                          top: 340,
                          left: 20,
                          right: 120,

                          child: Column(
                            mainAxisAlignment: .start,
                            crossAxisAlignment: .start,
                            spacing: 20,
                            children: [
                              Text(
                                project.companyFullName,
                                style: AppTypography.headlineLg.copyWith(
                                  color: AppColors.tertiaryContainer,
                                ),
                              ),
                              Text(
                                project.companyDescription,
                                style: AppTypography.bodyMd.copyWith(
                                  color: AppColors.inversePrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: Row(
                      crossAxisAlignment: .start,

                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: .start,
                            children: [
                              ...sectionHeader(
                                title: appText.appOverview,
                                text: project.appOverview,
                                icon: Icons.info_outline_rounded,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 0,
                                  right: 30,
                                  top: 30,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: .start,
                                  children: [
                                    DynamicContainer(
                                      width: 345,
                                      height: 190,
                                      icon: LucideIcons.puzzle,
                                      title: appText.appChallenge,
                                      text: project.appChallenge,
                                    ),

                                    DynamicContainer(
                                      width: 345,
                                      height: 190,
                                      icon: LucideIcons.wandSparkles,
                                      title: appText.appSolution,
                                      text: project.appSolution,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: TechStackContainer(stack: project.techStack),
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
            ),
          ),
        ),

        SizedBox(height: 30),
        Footer(),
      ],
    );
  }
}
