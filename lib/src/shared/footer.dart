import 'package:flutter/material.dart';
import 'package:portfolio/core/shared/const/external_urls_const.dart';
import 'package:portfolio/core/shared/design/theme/app_typography.dart';
import 'package:portfolio/l10n/app_localizations.dart';
import 'package:portfolio/src/shared/open_external_url.dart';

import '../../core/shared/design/theme/app_colors.dart';
import '../../core/shared/design/theme/app_text.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  bool isMobile = false;

  @override
  Widget build(BuildContext context) {
    final appText = AppLocalizations.of(context)!;

    return LayoutBuilder(
      builder: (context, constraints) {
        final size = constraints.maxWidth;

        if (size < 550) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            setState(() => isMobile = true);
          });
        }

        return Container(
          height: isMobile ? 130 : 80,
          color: AppColors.outlineVariant.withValues(alpha: 0.01),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: isMobile
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 10,
                    children: widgetBar(appText),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: widgetBar(appText),
                  ),
          ),
        );
      },
    );
  }

  List<Widget> widgetBar(AppLocalizations appText) {
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
          '©1989 - 2027 Built for High-Performance',
          maxLines: 2,
          textAlign: TextAlign.center,
          style: AppTypography.bodySm.copyWith(color: AppColors.inversePrimary),
        ),
      ),

      Row(
        mainAxisAlignment: isMobile
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
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
