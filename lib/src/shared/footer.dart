import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/shared/const/external_urls_const.dart';
import 'package:portfolio/core/shared/design/theme/app_typography.dart';
import 'package:portfolio/l10n/app_localizations.dart';
import 'package:portfolio/src/shared/open_external_url.dart';

import '../../core/shared/design/theme/app_colors.dart';
import '../../core/shared/design/theme/app_spacings.dart';
import '../../core/shared/design/theme/app_text.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final appText = AppLocalizations.of(context)!;

    return Padding(
      padding: EdgeInsets.only(top: AppSpacing.xl),
      child: Container(
        height: 80,
        color: AppColors.outlineVariant.withValues(alpha: 0.01),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: AppText(
                  'theDevJeff',
                  color: AppColors.inversePrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Flexible(
                child: Text(
                  '©1989 - 2027 theDevJeff  -  Built for High-Performance',
                  maxLines: 1,
                  style: AppTypography.bodySm.copyWith(
                    color: AppColors.inversePrimary,
                  ),
                ),
              ),

              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      openExternalURL(
                        url: githubProfileURL,
                        error: appText.cannotOpenExternalUrl,
                      );
                    },
                    child: Text(
                      'Github',
                      maxLines: 1,
                      style: AppTypography.bodySm.copyWith(
                        color: AppColors.inversePrimary,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      openExternalURL(
                        url: linkedInProfile,
                        error: appText.cannotOpenExternalUrl,
                      );
                    },
                    child: Text(
                      'LinkedIn',
                      style: AppTypography.bodySm.copyWith(
                        color: AppColors.inversePrimary,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      sendEmail(email: email, error: appText.sendEmailError);
                    },
                    child: Text(
                      'E-mail',
                      style: AppTypography.bodySm.copyWith(
                        color: AppColors.inversePrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
