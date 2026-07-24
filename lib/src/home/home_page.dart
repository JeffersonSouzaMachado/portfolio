import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/const/external_urls_const.dart';
import 'package:portfolio/core/design/icons/images_app.dart';
import 'package:portfolio/core/design/theme/app_colors.dart';
import 'package:portfolio/core/design/theme/app_radius.dart';
import 'package:portfolio/core/design/theme/app_spacings.dart';
import 'package:portfolio/core/design/theme/app_text.dart';
import 'package:portfolio/core/design/theme/app_typography.dart';
import 'package:portfolio/core/router/routes.dart';
import 'package:portfolio/l10n/app_localizations.dart';
import 'package:portfolio/src/widgets/metric_resume.dart';
import 'package:portfolio/src/widgets/metric_resume_model.dart';
import 'package:portfolio/src/widgets/open_external_url.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final double gradientCircleSize = 620;

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
                  child: Container(
                    width: gradientCircleSize,
                    height: gradientCircleSize,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        center: Alignment.center,
                        radius: 0.5,
                        colors: [
                          AppColors.primary.withValues(alpha: 0.08),
                          AppColors.accent.withValues(alpha: 0.08),
                          Colors.transparent,
                        ],
                        stops: const [0.0, 0.75, 1.0],
                      ),
                    ),
                  ),
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
                            Container(
                              height: 30,
                              decoration: BoxDecoration(
                                color: AppColors.onSecondaryFixedVariant
                                    .withValues(alpha: 0.1),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                                border: Border.all(color: AppColors.accent),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Row(
                                  mainAxisAlignment: .center,
                                  mainAxisSize: .min,
                                  children: [
                                    Container(
                                      width: 10,
                                      decoration: BoxDecoration(
                                        color: AppColors.accent,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Flexible(
                                      child: AppText(
                                        appText.availableForProjects,
                                        color: AppColors.accent,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 30),
                              child: AppTextSpan(
                                spans: [
                                  TextSpan(
                                    text: '${appText.architecting} ',
                                    style: AppTypography.headlineXl.copyWith(
                                      color: AppColors.onSecondaryContainer,
                                    ),
                                  ),
                                  TextSpan(
                                    text: appText.highPerformance,
                                    style: AppTypography.headlineXl.copyWith(
                                      color: AppColors.inversePrimary,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' ${appText.mobileEcosystems}',
                                    style: AppTypography.headlineXl.copyWith(
                                      color: AppColors.onSecondaryContainer,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            AppText(
                              appText.aboutDescription,
                              color: AppColors.inversePrimary,
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 30),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 50,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors
                                              .onPrimaryContainer
                                              .withValues(alpha: 0.2),
                                        ),
                                        onPressed: () {
                                          context.go(Routes.projects);
                                        },
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                              color: AppColors.inversePrimary
                                                  .withValues(alpha: 0.2),
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadiusGeometry.all(
                                                  Radius.circular(10),
                                                ),
                                          ),
                                        ),
                                        onPressed: () =>
                                            openExternalURL(githubProfileURL),
                                        child: AppText(
                                          appText.github,
                                          maxLines: 1,
                                          color: AppColors.inversePrimary,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
