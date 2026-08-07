import 'package:portfolio/core/shared/asset_type.dart';
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
      // assetType: AssetType.values.byName(json['assetType'] as String), // Mais direto, mas precisa que seja garantido que os nomes sejam identicos.
      assetType: AssetType.values.firstWhere(
        (type) => type.name == json['assetType'],
        orElse: () => AssetType.icon,
      ),
    );
  }
}
