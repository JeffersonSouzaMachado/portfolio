import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/core/shared/asset_type.dart';
import 'package:portfolio/core/mappers/project_asset_mapper.dart';

Widget buildIcon({
  required String icon,
  required AssetType assetType,
  double size = 24,
  Color? color,
}) {
  if (assetType == AssetType.icon) {
    return Icon(ProjectAssetMapper.icon(icon), size: size, color: color);
  }

  if (assetType == AssetType.svg) {
    return SvgPicture.asset(
      ProjectAssetMapper.svg(icon),
      width: size,
      height: size,
      colorFilter: color == null
          ? null
          : ColorFilter.mode(color, BlendMode.srcIn),
    );
  }

  throw ArgumentError('Tipo de ícone não suportado: ${icon.runtimeType}');
}
