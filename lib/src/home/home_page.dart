import 'package:flutter/material.dart';
import 'package:portfolio/core/design/theme/app_colors.dart';
import 'package:portfolio/core/design/theme/app_spacings.dart';
import 'package:portfolio/core/design/theme/app_text.dart';
import 'package:portfolio/core/design/theme/app_typography.dart';
import 'package:portfolio/l10n/app_localizations.dart';

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
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.xl,
                vertical: AppSpacing.xxl * 2,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: 30,
                          decoration: BoxDecoration(
                            color: AppColors.onSecondaryFixedVariant.withValues(
                              alpha: 0.1,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            border: Border.all(color: AppColors.accent),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                Container(
                                  width: 10,
                                  decoration: BoxDecoration(
                                    color: AppColors.accent,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                SizedBox(width: 10),
                                AppText(
                                  appText.availableForProjects,
                                  color: AppColors.accent,
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
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 60,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors
                                          .onPrimaryContainer
                                          .withValues(alpha: 0.2),
                                    ),
                                    onPressed: () {},
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        AppText(
                                          appText.viewWorks,
                                          color: AppColors.inversePrimary,
                                        ),
                                        SizedBox(width: 10,),
                                        Icon(Icons.arrow_forward_ios)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: SizedBox(
                                  height: 60,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          color: AppColors.inversePrimary
                                              .withValues(alpha: 0.2),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadiusGeometry.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: AppText(
                                      appText.github,
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
                  Container(
                    width: 500,
                    height: 500,
                    color: AppColors.secondary,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
