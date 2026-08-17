import 'package:portfolio/src/projects/domain/entities/project_info_entity.dart';

import 'tech_stack_entity.dart';

class ProjectEntity {
  const ProjectEntity({
    required this.order,
    required this.cardImage,
    required this.shortCompanyName,
    required this.shortDescription,
    required this.companyFullName,
    required this.companyDescription,
    required this.appOverview,
    required this.appChallenge,
    required this.appSolution,
    required this.techStack,
    required this.appMockups,
    required this.projectInfo,
  });

  final int order;
  final String cardImage;
  final String shortCompanyName;
  final String shortDescription;
  final String companyFullName;
  final String companyDescription;
  final String appOverview;
  final String appChallenge;
  final String appSolution;
  final List<TechStackEntity> techStack;
  final List<String> appMockups;
  final ProjectInfoEntity projectInfo;
}
