import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/core/shared/design/icons/animations.dart';
import 'package:portfolio/core/shared/design/theme/app_colors.dart';
import 'package:portfolio/core/shared/design/theme/app_typography.dart';
import 'package:portfolio/l10n/app_localizations.dart';

class UnderConstructionWarning extends StatelessWidget {
  const UnderConstructionWarning({super.key});

  @override
  Widget build(BuildContext context) {
    final appText = AppLocalizations.of(context)!;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          appText.underConstruction,
          style: AppTypography.headlineLg.copyWith(
            color: AppColors.inversePrimary,
          ),
        ),
        SizedBox(
          height: 300,
          child: Lottie.asset(LottieAnimations.websiteConstruction),
        ),
      ],
    );
  }
}
