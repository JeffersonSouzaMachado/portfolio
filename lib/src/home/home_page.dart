import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/const/external_urls_const.dart';
import 'package:portfolio/core/design/icons/images_app.dart';
import 'package:portfolio/core/design/theme/app_colors.dart';
import 'package:portfolio/core/design/theme/app_spacings.dart';
import 'package:portfolio/core/design/theme/app_text.dart';
import 'package:portfolio/core/design/theme/app_typography.dart';
import 'package:portfolio/core/router/routes.dart';
import 'package:portfolio/l10n/app_localizations.dart';
import 'package:portfolio/src/home/widgets/available_header_tag.dart';
import 'package:portfolio/src/home/widgets/central_buttons_row.dart';
import 'package:portfolio/src/home/widgets/gradient_circle_background.dart';
import 'package:portfolio/src/home/widgets/metric_resume.dart';
import 'package:portfolio/src/home/widgets/page_main_text.dart';
import 'package:portfolio/src/shared/open_external_url.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final appText = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Positioned(
                  right: 0,
                  top: 10,
                  child: GradientCircleBackground(),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.xl,
                    AppSpacing.xxl,
                    AppSpacing.xl,
                    0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 50,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AvailableHeaderTag(appText: appText),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 30),
                              child: PageMainText(appText: appText),
                            ),

                            AppText(
                              appText.aboutDescription,
                              color: AppColors.inversePrimary,
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 30),
                              child: CentralButtonsRow(appText: appText),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(AppSpacing.md),
                          child: Image.asset(ImagesApp.code),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.lg,
                AppSpacing.xxl,
                AppSpacing.lg,
                AppSpacing.xl,
              ),
              child: MetricResume(),
            ),
          ],
        ),
      ),
    );
  }
}
