import 'package:portfolio/src/skills/domain/entities/strong_skills_entity.dart';
import 'package:portfolio/src/skills/domain/entities/tech_skill_entity.dart';

class SkillsEntity {
  SkillsEntity({
    required this.secondarySkills,
    required this.strongestSkills,
    required this.techSkills,
  });

  final List<String> secondarySkills;
  final List<StrongSkillsEntity> strongestSkills;
  final List<TechSkillEntity> techSkills;
}
