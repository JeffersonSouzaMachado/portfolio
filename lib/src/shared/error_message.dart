import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:portfolio/core/shared/design/theme/app_colors.dart';
import 'package:portfolio/core/shared/design/theme/app_typography.dart';

import '../../l10n/app_localizations.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({super.key, required this.error});

  final Object error;

  @override
  Widget build(BuildContext context) {
    final appText = AppLocalizations.of(context)!;
    return Row(
      mainAxisAlignment: .center,
      crossAxisAlignment: .center,
      children: [
        Icon(LucideIcons.circleX, color: AppColors.errorContainer),
        SizedBox(width: 20),
        Column(
          mainAxisAlignment: .start,
          mainAxisSize: .min,
          children: [
            Text(
              appText.errorLoadingMessage,
              style: AppTypography.bodyLg.copyWith(
                color: AppColors.errorContainer,
              ),
            ),
            Text(
              appText.backAgainLater,
              style: AppTypography.headlineMd.copyWith(
                color: AppColors.inversePrimary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
