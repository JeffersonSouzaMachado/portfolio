import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/shared/design/theme/app_colors.dart';
import '../../../../core/shared/design/theme/app_typography.dart';
import 'custom_container.dart';


class DynamicContainer extends StatefulWidget {
  const DynamicContainer({
    super.key,
    required this.icon,
    required this.title,
    required this.text,
    required this.height,
    this.isMobile = false,
  });

  final IconData icon;
  final String title;
  final String text;
  final double? height;
  final bool isMobile;

  @override
  State<DynamicContainer> createState() => _DynamicContainerState();
}

class _DynamicContainerState extends State<DynamicContainer> {
  bool isExpand = false;

  void toggleExpand() {
    setState(() {
      isExpand = !isExpand;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: toggleExpand,
      child: AnimatedSize(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        alignment: Alignment.topCenter,
        child: CustomContainer(
          height: isExpand ? null : widget.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Row(
                  spacing: 10,
                  children: [
                    Icon(widget.icon, color: AppColors.accent),
                    Expanded(
                      child: Text(
                        widget.title,
                        maxLines: 1,
                        style: AppTypography.headlineLgMobile.copyWith(
                          color: AppColors.accent,
                        ),
                      ),
                    ),

                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          isExpand
                              ? LucideIcons.minimize2
                              : LucideIcons.maximize2,
                          color: AppColors.inversePrimary,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),

                if (isExpand)
                  Text(
                    widget.text,
                    style: AppTypography.bodySm.copyWith(
                      color: AppColors.inversePrimary,
                    ),
                  )
                else
                  Expanded(
                    child: Text(
                      widget.text,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 6,
                      style: AppTypography.bodySm.copyWith(
                        color: AppColors.inversePrimary,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
