import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/shared/const/external_urls_const.dart';
import 'package:portfolio/core/shared/design/theme/app_colors.dart';
import 'package:portfolio/core/shared/design/theme/app_text.dart';
import 'package:portfolio/core/router/routes.dart';
import 'package:portfolio/l10n/app_localizations.dart';
import 'package:portfolio/src/shared/open_external_url.dart';

class CentralButtonsRow extends StatelessWidget {
  const CentralButtonsRow({super.key, required this.appText});

  final AppLocalizations appText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.onPrimaryContainer.withValues(
                  alpha: 0.2,
                ),
              ),
              onPressed: () {
                context.go(Routes.projects);
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: AppText(
                      appText.viewWorks,
                      maxLines: 1,
                      color: AppColors.inversePrimary,
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: SizedBox(
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: AppColors.inversePrimary.withValues(alpha: 0.2),
                    width: 2,
                  ),
                  borderRadius: BorderRadiusGeometry.all(Radius.circular(10)),
                ),
              ),
              onPressed: () => openExternalURL(
                url: githubProfileURL,
                error: appText.cannotOpenExternalUrl,
              ),
              child: AppText(
                appText.github,
                maxLines: 1,
                color: AppColors.inversePrimary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
