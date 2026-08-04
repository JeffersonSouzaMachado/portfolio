import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:portfolio/src/contacts/widgets/schedule.dart';

import '../../../core/shared/const/external_urls_const.dart';
import '../../../core/shared/const/local_text_const.dart';
import '../../../core/shared/design/theme/app_colors.dart';
import '../../../core/shared/design/theme/app_spacings.dart';
import '../../../core/shared/design/theme/app_text.dart';
import '../../../core/shared/design/theme/app_typography.dart';
import '../../../l10n/app_localizations.dart';
import '../../shared/gradient_container.dart';
import 'connectivity_widget.dart';

Widget description({required AppLocalizations appText, bool isMobile = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      AppText(
        appText.connectivity.toUpperCase(),
        color: AppColors.accent,
        fontSize: 14,
      ),
      SizedBox(height: AppSpacing.lg),
      MarkdownBody(
        data: appText.letsBuildNextGenerationOfTech,
        softLineBreak: true,
        styleSheet: MarkdownStyleSheet(
          p: AppTypography.headlineXl.copyWith(color: AppColors.inversePrimary),
          strong: AppTypography.headlineXl.copyWith(color: AppColors.accent),
        ),
      ),
      SizedBox(height: AppSpacing.md),
      AppText(appText.specializedText, color: AppColors.inversePrimary),

      Padding(
        padding: EdgeInsets.symmetric(vertical: AppSpacing.xl),
        child: Column(
          spacing: 30,
          children: [
            ConnectivityWidget(
              icon: Icons.mail_outline,
              label: appText.writeToMe,
              text: email,
              isCircle: false,
            ),

            ConnectivityWidget(
              icon: Icons.location_on_sharp,
              label: appText.operationBase,
              text: localOperationBase,
              isCircle: false,
            ),
          ],
        ),
      ),

      Padding(
        padding: EdgeInsets.only(bottom: AppSpacing.xl),
        child: GradientContainer(
          width: double.infinity,
          height: isMobile ? 150 : 87,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppSpacing.md,
              horizontal: AppSpacing.xl,
            ),
            child: isMobile
                ? Column(children: scheduleContainer(appText: appText))
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: scheduleContainer(appText: appText),
                  ),
          ),
        ),
      ),
    ],
  );
}
