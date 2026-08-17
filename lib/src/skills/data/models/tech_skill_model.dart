import 'package:portfolio/src/skills/domain/entities/tech_skill_entity.dart';

class TechSkillModel extends TechSkillEntity {
  TechSkillModel({
    required super.skill,
    required super.level,
  });

  factory TechSkillModel.fromJson(Map<String, dynamic> json) {
    return TechSkillModel(
      skill: json['skill']?.toString() ?? '',
      level: json['level']?.toString() ?? '',
    );
  }
}
