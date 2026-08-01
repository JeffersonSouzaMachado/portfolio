import 'package:flutter/material.dart';
import 'package:portfolio/core/shared/design/theme/app_colors.dart';
import 'package:portfolio/core/shared/design/theme/app_text.dart';
import 'package:portfolio/l10n/app_localizations.dart';

class AvailableHeaderTag extends StatelessWidget {
  const AvailableHeaderTag({super.key, required this.appText});

  final AppLocalizations appText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.onSecondaryFixedVariant.withValues(alpha: 0.1),
        borderRadius: BorderRadius.all(Radius.circular(15)),
        border: Border.all(color: AppColors.accent),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: .center,
          mainAxisSize: .min,
          children: [
            Container(
              width: 10,
              height: 20,
              decoration: BoxDecoration(
                color: AppColors.accent,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 10),
            Flexible(
              child: AppText(
                appText.availableForProjects,
                maxLines: 2,
                color: AppColors.accent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
