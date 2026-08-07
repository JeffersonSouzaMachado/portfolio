import 'package:flutter/material.dart';

import '../../../../core/shared/design/theme/app_colors.dart';


class CustomContainer extends StatelessWidget {
  const CustomContainer({
    this.width,
    this.height,
    this.radius = 20,
    required this.child,
    super.key,
  });

  final double? width;
  final double? height;
  final Widget child;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.primaryContainer,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        border: Border.all(color: AppColors.accent.withValues(alpha: 0.1)),
      ),
      child: child,
    );
  }
}
