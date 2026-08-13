import 'package:flutter/material.dart';
import 'package:portfolio/core/shared/design/theme/app_colors.dart';
import 'package:portfolio/core/shared/design/theme/app_typography.dart';

import '../../l10n/app_localizations.dart';

class LoadingMessage extends StatelessWidget {
  const LoadingMessage({super.key});

  @override
  Widget build(BuildContext context) {
    final appText = AppLocalizations.of(context)!;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          CircularProgressIndicator(color: AppColors.inversePrimary),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
             appText.loadingPleaseWait,textAlign: TextAlign.center,
              style: AppTypography.headlineMd.copyWith(
                color: AppColors.inversePrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
