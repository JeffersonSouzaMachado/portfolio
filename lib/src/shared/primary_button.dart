import 'package:flutter/material.dart';

import '../../core/shared/design/theme/app_colors.dart';
import '../../core/shared/design/theme/app_text.dart';

enum PrimaryButtonType { filled, outlined }

class PrimaryButton extends StatelessWidget {
  const PrimaryButton._({
    super.key,
    required this.label,
    required this.onPressed,
    required this.type,
    this.backgroundColor,
    this.borderColor,
    this.prefixIcon,
    this.suffixIcon,
    this.iconColor = AppColors.inversePrimary,
    this.labelColor = AppColors.inversePrimary,
  });

  factory PrimaryButton.filled({
    Key? key,
    required String label,
    required VoidCallback? onPressed,
    Color? backgroundColor,
    Color? borderColor,
    Color? iconColor,
    IconData? prefixIcon,
    IconData? suffixIcon,
    Color? labelColor,
  }) {
    return PrimaryButton._(
      key: key,
      label: label,
      onPressed: onPressed,
      type: PrimaryButtonType.filled,
      backgroundColor: backgroundColor,
      iconColor: iconColor,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      labelColor: labelColor,
    );
  }

  factory PrimaryButton.outlined({
    Key? key,
    required String label,
    required VoidCallback? onPressed,
    Color? borderColor,
    Color? iconColor,
    IconData? prefixIcon,
    IconData? suffixIcon,
    Color? labelColor,
  }) {
    return PrimaryButton._(
      key: key,
      label: label,
      onPressed: onPressed,
      type: PrimaryButtonType.outlined,
      iconColor: iconColor,
      borderColor: borderColor,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      labelColor: labelColor,
    );
  }

  final String label;
  final VoidCallback? onPressed;
  final PrimaryButtonType type;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? iconColor;
  final Color? labelColor;
  final IconData? prefixIcon;
  final IconData? suffixIcon;

  @override
  Widget build(BuildContext context) {
    final child = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (prefixIcon != null) ...[
          Icon(prefixIcon, color: iconColor),
          const SizedBox(width: 8),
        ],
        Flexible(child: AppText(label, maxLines: 1, color: labelColor)),
        if (suffixIcon != null) ...[
          const SizedBox(width: 8),
          Icon(suffixIcon, color: iconColor),
        ],
      ],
    );

    return switch (type) {
      PrimaryButtonType.filled => ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
        onPressed: onPressed,
        child: child,
      ),
      PrimaryButtonType.outlined => ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: borderColor != null
                ? borderColor!
                : AppColors.inversePrimary,
          ),
        ),
        onPressed: onPressed,
        child: child,
      ),
    };
  }
}
