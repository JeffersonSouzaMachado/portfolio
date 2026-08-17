import 'package:flutter/material.dart';
import 'package:portfolio/core/shared/design/theme/app_colors.dart';

class JourneyIndicator extends StatelessWidget {
  const JourneyIndicator({
    super.key,
    required this.isLast,
    required this.highlighted,
  });

  final bool isLast;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          if (!isLast)
            Positioned(
              top: 14,
              bottom: 0,
              child: Container(
                width: 2,
                color: AppColors.outline.withValues(alpha: 0.5),
              ),
            ),
          Container(
            width: 14,
            height: 14,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: highlighted ? AppColors.accent : AppColors.inversePrimary,
              boxShadow: highlighted
                  ? [
                      BoxShadow(
                        color: AppColors.accent.withValues(alpha: 0.35),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ]
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
