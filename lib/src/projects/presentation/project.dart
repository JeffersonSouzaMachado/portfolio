import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:portfolio/core/shared/design/theme/app_colors.dart';
import 'package:portfolio/core/shared/design/theme/app_spacings.dart';
import 'package:portfolio/core/shared/design/theme/app_typography.dart';
import 'package:portfolio/l10n/app_localizations.dart';
import 'package:portfolio/core/mappers/project_asset_mapper.dart';
import 'package:portfolio/src/projects/domain/entities/project_entity.dart';
import 'package:portfolio/src/projects/presentation/widgets/app_mockup.dart';
import 'package:portfolio/src/projects/presentation/widgets/dynamic_container.dart';
import 'package:portfolio/src/projects/presentation/widgets/section_header.dart';
import 'package:portfolio/src/projects/presentation/widgets/tech_stack_container.dart';

import 'package:portfolio/src/shared/footer.dart';
import 'package:portfolio/src/shared/primary_button.dart';

import '../../../core/shared/design/theme/app_text.dart';
import '../../shared/open_external_url.dart';
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
            children: isMobile
                ? [
                    ...mobile(
                      sectionTitle: appText.appOverview,
                      project: project,
                      appText: appText,
                    ),
                    Footer(isMobile: isMobile),
                  ]
                : [...desktop(appText: appText, project: project), Footer()],
          ),
        );
      },
    );
  }
}

List<Widget> mobile({
  required String sectionTitle,
  required ProjectModel project,
  required AppLocalizations appText,
}) {
  return [
    Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.all(Radius.circular(20)),
            child: SizedBox(
              width: 100,
              height: 100,
              child: Image.asset(
                ProjectAssetMapper.image(project.cardImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: AppSpacing.lg),
          Expanded(
            child: Text(
              project.companyFullName,
              maxLines: 3,
              style: AppTypography.headlineLgMobile.copyWith(
                color: AppColors.tertiaryContainer,
              ),
            ),
          ),
        ],
      ),
    ),
    Padding(
      padding: EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppSpacing.lg,
        AppSpacing.lg,
        0,
      ),
      child: Row(
        mainAxisAlignment: .center,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Text(
                    project.projectInfo.rate,
                    style: AppTypography.bodyMd.copyWith(
                      color: AppColors.inversePrimary,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(width: 5),
                  Icon(Icons.star, color: AppColors.inversePrimary, size: 15),
                ],
              ),
              Text(
                'avaliações',
                style: AppTypography.bodySm.copyWith(
                  color: AppColors.inversePrimary,
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              width: 1,
              height: 35,
              color: AppColors.inversePrimary,
            ),
          ),

          Column(
            children: [
              Text(
                '${project.projectInfo.downloads} mil+',
                style: AppTypography.bodyMd.copyWith(
                  color: AppColors.inversePrimary,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                'downloads',
                style: AppTypography.bodySm.copyWith(
                  color: AppColors.inversePrimary,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
    Padding(
      padding: EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppSpacing.lg,
        AppSpacing.lg,
        0,
      ),
      child: Column(
        spacing: AppSpacing.lg,
        children: buttons(project: project, width: double.infinity),
      ),
    ),
    Padding(
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
    ),
  ];
}

List<Widget> desktop({
  required AppLocalizations appText,
  required ProjectModel project,
}) {
  return [
    Padding(
      padding: EdgeInsets.only(
        top: AppSpacing.xl,
        right: AppSpacing.lg,
        left: AppSpacing.lg,
      ),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Column(
            crossAxisAlignment: .start,
            mainAxisAlignment: .spaceBetween,
            spacing: AppSpacing.lg,
            children: [
              Text(
                project.companyFullName,
                maxLines: 3,
                style: AppTypography.headlineLg.copyWith(
                  color: AppColors.tertiaryContainer,
                ),
              ),

              Row(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            project.projectInfo.rate,
                            style: AppTypography.bodyMd.copyWith(
                              color: AppColors.inversePrimary,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.star,
                            color: AppColors.inversePrimary,
                            size: 15,
                          ),
                        ],
                      ),
                      Text(
                        'avaliações',
                        style: AppTypography.bodySm.copyWith(
                          color: AppColors.inversePrimary,
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      width: 1,
                      height: 35,
                      color: AppColors.inversePrimary,
                    ),
                  ),

                  Column(
                    children: [
                      Text(
                        '${project.projectInfo.downloads} mil+',
                        style: AppTypography.bodyMd.copyWith(
                          color: AppColors.inversePrimary,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        'downloads',
                        style: AppTypography.bodySm.copyWith(
                          color: AppColors.inversePrimary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                spacing: AppSpacing.lg,
                children: buttons(project: project),
              ),
            ],
          ),
          Flexible(
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.all(Radius.circular(20)),

              child: SizedBox(
                width: 200,
                height: 200,
                child: Image.asset(
                  ProjectAssetMapper.image(project.cardImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    Padding(
      padding: EdgeInsets.symmetric(vertical: 50, horizontal: AppSpacing.lg),
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
                    mainAxisAlignment: .center,
                    spacing: 30,
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
    ),
  ];
}

List<Widget> buttons({
  required ProjectEntity project,
  double height = 50,
  double width = 200,
}) {
  return [
    SizedBox(
      height: height,
      width: width,
      child: PrimaryButton.filled(
        label: 'Ver na Play Store',
        onPressed: () {
          openExternalURL(
            url: project.projectInfo.playStoreUrl,
            error: "Não foi possivel abrir",
          );
        },
        labelColor: AppColors.inversePrimary,
        backgroundColor: AppColors.onPrimaryContainer.withValues(alpha: 0.2),
      ),
    ),
    SizedBox(
      height: height,
      width: width,
      child: PrimaryButton.outlined(
        label: 'Ver na App Store',
        onPressed: () {
          openExternalURL(
            url: project.projectInfo.appStoreUrl,
            error: "Não foi possivel abrir",
          );
        },
        labelColor: AppColors.inversePrimary,
      ),
    ),
  ];
}
