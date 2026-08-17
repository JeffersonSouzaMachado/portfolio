import 'package:portfolio/src/skills/data/models/strong_skill_model.dart';
import 'package:portfolio/src/skills/data/models/tech_skill_model.dart';
import 'package:portfolio/src/skills/domain/entities/skills_entity.dart';

class SkillsModel extends SkillsEntity {
  SkillsModel({
    required super.secondarySkills,
    required super.strongestSkills,
    required super.techSkills,
  });

  factory SkillsModel.fromJson(Map<String, dynamic> json) {
    final secondarySkillsJson = json['secondarySkills'] as List<dynamic>? ?? [];
    final strongestSkillsJson = json['strongestSkills'] as List<dynamic>? ?? [];
    final techSkillsJson = json['techSkills'] as List<dynamic>? ?? [];

    return SkillsModel(
      secondarySkills: secondarySkillsJson
          .map((item) => item.toString())
          .where((item) => item.isNotEmpty)
          .toList(),
      strongestSkills: strongestSkillsJson
          .map(
            (item) => StrongSkillModel.fromJson(
              Map<String, dynamic>.from(item as Map),
            ),
          )
          .toList(),
      techSkills: techSkillsJson
          .map(
            (item) => TechSkillModel.fromJson(
              Map<String, dynamic>.from(item as Map),
            ),
          )
          .toList(),
    );
  }
}
