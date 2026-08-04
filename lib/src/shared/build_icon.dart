import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget buildIcon(
    Object icon, {
      double size = 24,
      Color? color,
    }) {
  if (icon is IconData) {
    return Icon(
      icon,
      size: size,
      color: color,
    );
  }

  if (icon is String) {
    return SvgPicture.asset(
      icon,
      width: size,
      height: size,
      colorFilter: color == null
          ? null
          : ColorFilter.mode(
        color,
        BlendMode.srcIn,
      ),
    );
  }

  throw ArgumentError(
    'Tipo de ícone não suportado: ${icon.runtimeType}',
  );
}