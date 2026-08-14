import 'package:portfolio/src/projects/domain/entities/project_info_entity.dart';

class ProjectInfoModel extends ProjectInfoEntity {
  ProjectInfoModel({
    required super.downloads,
    required super.playStoreUrl,
    required super.appStoreUrl,
    required super.rate,
  });

  factory ProjectInfoModel.fromJson(Map<String, dynamic> json) {
    return ProjectInfoModel(
      downloads: json['downloads'],
      playStoreUrl: json['playStoreUrl'],
      appStoreUrl: json['appStoreUrl'],
      rate: json['rate'],
    );
  }
}
