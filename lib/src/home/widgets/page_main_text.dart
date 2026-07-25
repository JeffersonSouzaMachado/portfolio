import 'package:flutter/material.dart';
import 'package:portfolio/core/design/theme/app_colors.dart';
import 'package:portfolio/core/design/theme/app_text.dart';
import 'package:portfolio/core/design/theme/app_typography.dart';
import 'package:portfolio/l10n/app_localizations.dart';

class PageMainText extends StatelessWidget {
  const PageMainText({super.key, required this.appText});

  final AppLocalizations appText;

  @override
  Widget build(BuildContext context) {
    return AppTextSpan(
      spans: [
        TextSpan(
          text: '${appText.architecting} ',
          style: AppTypography.headlineXl.copyWith(
            color: AppColors.onSecondaryContainer,
          ),
        ),
        TextSpan(
          text: appText.highPerformance,
          style: AppTypography.headlineXl.copyWith(
            color: AppColors.inversePrimary,
          ),
        ),
        TextSpan(
          text: ' ${appText.mobileEcosystems}',
          style: AppTypography.headlineXl.copyWith(
            color: AppColors.onSecondaryContainer,
          ),
        ),
      ],
    );
  }
}
