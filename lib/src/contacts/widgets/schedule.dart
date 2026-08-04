import 'package:flutter/material.dart';

import '../../../core/shared/const/external_urls_const.dart';
import '../../../core/shared/design/theme/app_colors.dart';
import '../../../core/shared/design/theme/app_typography.dart';
import '../../../l10n/app_localizations.dart';
import '../../shared/open_external_url.dart';

List<Widget> scheduleContainer({required AppLocalizations appText}) {
  return [
    Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            appText.readyToJumpIn,
            maxLines: 1,
            style: AppTypography.headlineMd.copyWith(
              color: AppColors.inversePrimary,
            ),
          ),
          SizedBox(height: 6),
          Text(
            appText.scheduleAnCall,
            maxLines: 1,
            style: AppTypography.labelSm.copyWith(
              color: AppColors.inversePrimary,
            ),
          ),
        ],
      ),
    ),
    Expanded(
      child: ElevatedButton(
        onPressed: () {
          openExternalURL(
            url: calendly,
            error: 'Não foi possivel abrir sua agenda',
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accent,
          padding: EdgeInsets.zero,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 2,
              child: Text(
                appText.schedule,
                maxLines: 1,
                style: AppTypography.bodyLg,
              ),
            ),
            Flexible(child: Icon(Icons.arrow_forward)),
          ],
        ),
      ),
    ),
  ];
}
