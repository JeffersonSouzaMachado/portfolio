import 'package:portfolio/src/skills/domain/entities/graduation_entity.dart';

class GraduationModel extends GraduationEntity {
  const GraduationModel({
    required super.institution,
    required super.course,
    required super.period,
  });

  factory GraduationModel.fromJson(Map<String, dynamic> json) {
    return GraduationModel(
      institution: json['institution']?.toString() ?? '',
      course: json['course']?.toString() ?? '',
      period: json['period']?.toString() ?? '',
    );
  }
}
