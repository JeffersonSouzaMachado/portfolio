import 'package:flutter/material.dart';
import 'package:portfolio/core/shared/design/theme/app_colors.dart';
import 'package:portfolio/core/shared/design/theme/app_text.dart';
import 'package:portfolio/src/shared/gradient_container.dart';

class ConnectivityWidget extends StatelessWidget {
  const ConnectivityWidget({
    this.icon,
    this.label,
    this.text,
    this.isCircle = false,
    this.iconColor = AppColors.accent,
    super.key,
  });

  final IconData? icon;
  final Color? iconColor;
  final String? label;
  final String? text;
  final bool isCircle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon != null
            ? GradientContainer(
                isCircle: isCircle,
                child: Icon(icon, color: iconColor),
              )
            : SizedBox.shrink(),

        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            label != null
                ? AppText(label!, color: AppColors.inversePrimary, fontSize: 12)
                : SizedBox.shrink(),
            text != null
                ? DefaultSelectionStyle(
                    selectionColor: AppColors.inversePrimary.withValues(
                      alpha: 0.1,
                    ),
                    child: SelectionArea(
                      child: AppText(
                        text!,
                        color: AppColors.inversePrimary,
                        fontSize: 20,
                      ),
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ],
    );
  }
}
