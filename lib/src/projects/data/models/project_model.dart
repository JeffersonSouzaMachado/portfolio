import 'package:portfolio/src/projects/data/models/project_info_model.dart';
import 'package:portfolio/src/projects/data/models/tech_stack_model.dart';
import 'package:portfolio/src/projects/domain/entities/project_entity.dart';

class ProjectModel extends ProjectEntity {
  ProjectModel({

    required super.cardImage,
    required super.shortCompanyName,
    required super.shortDescription,
    required super.companyFullName,
    required super.companyDescription,
    required super.appOverview,
    required super.appChallenge,
    required super.appSolution,
    required super.techStack,
    required super.appMockups,
    required super.projectInfo,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    final techStackJson = json['techStack'] as List<dynamic>? ?? [];
    final appMockupsJson = json['appMockups'] as List<dynamic>? ?? [];
    final projectInfoJson = json['projectInfo'] as Map;

    return ProjectModel(
      cardImage: json['cardImage'],
      shortCompanyName: json['shortCompanyName'],
      shortDescription: json['shortDescription'],
      companyFullName: json['companyFullName'],
      companyDescription: json['companyDescription'],
      appOverview: json['appOverview'],
      appChallenge: json['appChallenge'],
      appSolution: json['appSolution'],
      techStack: techStackJson
          .map(
            (item) =>
            TechStackModel.fromJson(Map<String, dynamic>.from(item as Map)),
      )
          .toList(),
      appMockups: appMockupsJson.map((item) => item.toString()).toList(),
      projectInfo: ProjectInfoModel.fromJson(
        Map<String, dynamic>.from(projectInfoJson),
      ),
    );
  }
}
