import 'package:flutter_svg/svg.dart';
import 'package:material_ui/material_ui.dart';
import 'package:portfolio/core/shared/design/theme/app_colors.dart';
import 'package:portfolio/core/shared/design/theme/app_text.dart';

Widget techTag({
  required String icon,
  required String technology,
  Color? color,
}) {
  return Container(
    width: 200,
    decoration: BoxDecoration(
      color: AppColors.secondary.withValues(alpha: 0.1),
      border: Border.all(color: AppColors.accent.withValues(alpha: 0.1)),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: Row(
        spacing: 10,
        mainAxisAlignment: .center,
        children: [
          SizedBox(height: 26, child: SvgPicture.asset(icon, color: color)),
          Flexible(child: AppText(technology, color: AppColors.inversePrimary, fontSize: 18, overflow: TextOverflow.ellipsis, maxLines: 1,)),
        ],
      ),
    ),
  );
}
