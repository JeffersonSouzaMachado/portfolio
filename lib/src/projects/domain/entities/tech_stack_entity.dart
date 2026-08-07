import 'package:portfolio/core/shared/asset_type.dart';

class TechStackEntity {
  TechStackEntity({
    required this.icon,
    required this.stack,
    required this.assetType,
  });

  final String icon;
  final String stack;
  final AssetType assetType;
}
