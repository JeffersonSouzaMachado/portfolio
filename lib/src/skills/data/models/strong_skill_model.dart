import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:portfolio/src/skills/domain/entities/strong_skills_entity.dart';

class StrongSkillModel extends StrongSkillsEntity {
  StrongSkillModel({
    required super.icon,
    required super.title,
    required super.text,
  });

  factory StrongSkillModel.fromJson(Map<String, dynamic> json) {
    return StrongSkillModel(
      icon: _SkillIconMapper.fromName(json['icon']?.toString()),
      title: json['title']?.toString() ?? '',
      text: json['text']?.toString() ?? '',
    );
  }
}

class _SkillIconMapper {
  static IconData fromName(String? name) {
    return switch (name) {
      'packageCheck' => LucideIcons.packageCheck,
      'wrench' => LucideIcons.wrench,
      _ => LucideIcons.badgeCheck,
    };
  }
}
