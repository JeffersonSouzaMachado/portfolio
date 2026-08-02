import 'package:portfolio/core/shared/design/icons/images_app.dart';
import 'package:portfolio/core/shared/design/theme/app_colors.dart';
import 'package:portfolio/src/home/presentation/widgets/metric_resume_model.dart';
import 'package:portfolio/src/projects/widgets/project_model.dart';

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
      companyName: 'Helpnei',
      shortDescription:
          'A Helpnei é uma plataforma de impacto social que conecta empresas patrocinadoras a pessoas em situação de vulnerabilidade econômica '
          'que desejam empreender. Por meio de um modelo de assinatura mensal, empresas patrocinam a formação de novos empreendedores, que '
          'recebem treinamento, suporte contínuo e acesso a uma loja online integrada a grandes marcas parceiras, como Magalu, Natura, Avon e Shopee.',
    ),
  ];
}
