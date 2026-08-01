import 'package:flutter/material.dart';
import 'package:portfolio/core/shared/const/external_urls_const.dart';
import 'package:portfolio/core/shared/design/theme/app_typography.dart';
import 'package:portfolio/l10n/app_localizations.dart';
import 'package:portfolio/src/shared/open_external_url.dart';

import '../../core/shared/design/theme/app_colors.dart';
import '../../core/shared/design/theme/app_spacings.dart';
import '../../core/shared/design/theme/app_text.dart';

class Footer extends StatelessWidget {
  const Footer({super.key, this.isMobile = false});

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final appText = AppLocalizations.of(context)!;

    return Container(
      height: isMobile ? 120 : 80,
      color: AppColors.outlineVariant.withValues(alpha: 0.01),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: isMobile
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 10,
                children: widget(appText),
              )
            : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: widget(appText)),
      ),
    );
  }

  List<Widget> widget(AppLocalizations appText) {
    return [
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
          style: AppTypography.bodySm.copyWith(color: AppColors.inversePrimary),
        ),
      ),

      Row(
         mainAxisAlignment: isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
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
    ];
  }
}
