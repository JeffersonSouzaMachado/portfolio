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
      shortCompanyName: 'Helpnei',
      shortDescription:
          'A Helpnei é uma plataforma de impacto social que conecta empresas patrocinadoras a pessoas em situação de vulnerabilidade econômica.',
      companyFullName: 'Helpnei +Renda para todos',
      companyDescription:
          'A Helpnei é uma plataforma de impacto social que conecta empresas patrocinadoras a pessoas em situação de vulnerabilidade econômica '
          'que desejam empreender. Por meio de um modelo de assinatura mensal, empresas patrocinam a formação de novos empreendedores, que '
          'recebem treinamento, suporte contínuo e acesso a uma loja online integrada a grandes marcas parceiras, como Magalu, Natura, Avon e Shopee.',
      appOverview:
          'Atuei no desenvolvimento do app desde a prototipagem, participando de todo o processo — da concepção criativa até o deploy nas lojas Apple Store e Play Store. '
          'Estive envolvido desde a primeira tela, com desenhos e fluxos criados no Miro e no Figma. No desenvolvimento, implementei autenticação,'
          ' banco de dados e armazenamento com Firebase (Auth, Firestore e Database), além de funcionalidades como geração e envio automático de PDFs por e-mail e geolocalização.'
          ' Também integrei o Sentry para monitoramento de erros e implementei o método de pagamento via Stark Bank. Posteriormente, conduzi a migração da infraestrutura para um backend próprio.',
      appChallenge:
          'Durante o cadastro, com autorização do usuário, coletávamos dados de geolocalização e informações do condomínio, '
          'armazenando-os em uma tabela para uso posterior na plataforma. Conforme a base de usuários cresceu, o volume de chamadas à API do '
          'Google Maps (usada para buscar localização e dados do local) aumentou proporcionalmente, elevando significativamente os custos '
          'operacionais e evidenciando a necessidade de repensar essa estratégia de integração.',
      appSolution:
          'Reestruturei o fluxo de busca em duas etapas: a cada novo cadastro, buscávamos apenas a latitude e longitude do '
          'usuário (gratuito). Com essas coordenadas, consultávamos uma tabela de cache com os condomínios já mapeados na região. '
          'Caso já existissem dados para aquele ponto, nenhuma nova chamada era feita. Caso contrário, buscávamos os condomínios num '
          'raio de 10 km — dado que já retornava em uma única chamada — e armazenávamos o resultado no cache para reutilização em '
          'cadastros futuros na mesma área.',
      techStack: ['techStack'],
      appMockups: ['appMockups'],
    ),
  ];
}
