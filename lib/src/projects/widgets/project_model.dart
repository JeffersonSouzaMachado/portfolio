import 'package:portfolio/src/projects/widgets/tech_stack_model.dart';

class ProjectModel {
  ProjectModel({
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
  });

  final String cardImage;
  final String shortCompanyName;
  final String shortDescription;
  final String companyFullName;
  final String companyDescription;
  final String appOverview;
  final String appChallenge;
  final String appSolution;
  final List<TechStackModel> techStack;
  final List<String> appMockups;
}
