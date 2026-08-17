import 'package:portfolio/src/skills/domain/entities/experience_entity.dart';

class ExperienceModel extends ExperienceEntity {
  const ExperienceModel({
    required super.role,
    required super.company,
    required super.period,
    required super.description,
    required super.tags,
  });

  factory ExperienceModel.fromJson(Map<String, dynamic> json) {
    final tagsJson = json['tags'] as List<dynamic>? ?? [];

    return ExperienceModel(
      role: json['role']?.toString() ?? '',
      company: json['company']?.toString() ?? '',
      period: json['period']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      tags: tagsJson
          .map((item) => item.toString())
          .where((item) => item.isNotEmpty)
          .toList(),
    );
  }
}
