import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:portfolio/core/shared/design/icons/images_app.dart';
import 'package:portfolio/core/shared/design/theme/app_colors.dart';
import 'package:portfolio/src/home/presentation/widgets/metric_resume_model.dart';
import 'package:portfolio/src/projects/widgets/project_model.dart';
import 'package:portfolio/src/projects/widgets/tech_stack_model.dart';

import '../../../l10n/app_localizations.dart';

List<MetricResumeModel> getMetricResume(AppLocalizations appText) {
  return [
    MetricResumeModel(
      title: "04+",
      text: appText.experienceYears,
      color: AppColors.accent,
    ),
    MetricResumeModel(
      title: "14",
      text: appText.appsInProduction,
      color: AppColors.secondary,
    ),
    MetricResumeModel(
      title: "5.6M",
      text: appText.activeUsers,
      color: AppColors.errorContainer,
    ),
    MetricResumeModel(
      title: "110+",
      text: appText.mergedPrs,
      color: AppColors.secondaryFixedDim,
    ),
  ];
}

List<ProjectModel> getDataProject(AppLocalizations appText) {
  return [
    ProjectModel(
      cardImage: ImagesApp.helpneiMainLogo,
      shortCompanyName: 'Helpnei',
      shortDescription: appText.helpneiShortDescription,
      companyFullName: 'Helpnei +Renda para todos',
      companyDescription: appText.helpneiCompanyDescription,
      appOverview: appText.helpneiOverview,
      appChallenge:appText.helpneiChallenge,
      appSolution: appText.helpneiResolution,
      techStack: [
        TechStackModel(icon: LucideIcons.code, stack: 'Flutter/Dart'),
        TechStackModel(icon: LucideIcons.database, stack: 'Firebase'),
        TechStackModel(icon: LucideIcons.mapPin, stack: 'Geo Location'),
        TechStackModel(icon: LucideIcons.gitGraph, stack: 'Github'),
        TechStackModel(icon: LucideIcons.bug, stack: 'Sentry'),
        TechStackModel(icon: LucideIcons.cloudUpload, stack: 'Codemagic'),
        TechStackModel(icon: LucideIcons.notepadText, stack: 'Jira'),
        TechStackModel(icon: LucideIcons.penTool, stack: 'Miro'),
      ],
      appMockups: [
        'assets/images/1.webp',
        'assets/images/2.webp',
        'assets/images/3.webp',
      ],
    ),
  ];
}
