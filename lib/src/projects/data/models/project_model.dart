import 'package:portfolio/src/projects/data/models/project_info_model.dart';
import 'package:portfolio/src/projects/data/models/tech_stack_model.dart';
import 'package:portfolio/src/projects/domain/entities/project_entity.dart';

class ProjectModel extends ProjectEntity {
  ProjectModel({
    required super.order,
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
      order: _parseOrder(json['order']),
      cardImage: json['cardImage']?.toString() ?? '',
      shortCompanyName: json['shortCompanyName']?.toString() ?? '',
      shortDescription: json['shortDescription']?.toString() ?? '',
      companyFullName: json['companyFullName']?.toString() ?? '',
      companyDescription: json['companyDescription']?.toString() ?? '',
      appOverview: json['appOverview']?.toString() ?? '',
      appChallenge: json['appChallenge']?.toString() ?? '',
      appSolution: json['appSolution']?.toString() ?? '',
      techStack: techStackJson
          .map(
            (item) => TechStackModel.fromJson(
              Map<String, dynamic>.from(item as Map),
            ),
          )
          .toList(),
      appMockups: appMockupsJson.map((item) => item.toString()).toList(),
      projectInfo: ProjectInfoModel.fromJson(
        Map<String, dynamic>.from(projectInfoJson),
      ),
    );
  }

  static int _parseOrder(dynamic value) {
    if (value is int) {
      return value;
    }

    if (value is num) {
      return value.toInt();
    }

    return int.tryParse(value?.toString() ?? '') ?? 0;
  }
}
