import 'package:portfolio/src/projects/domain/entities/tech_stack_entity.dart';

class TechStackModel extends TechStackEntity {
  TechStackModel({
    required super.icon,
    required super.stack,
    required super.assetType,
  });

  factory TechStackModel.fromJson(Map<String, dynamic> json) {
    return TechStackModel(
      icon: json['icon'],
      stack: json['stack'],
      assetType: json['assetType'],
    );
  }
}
