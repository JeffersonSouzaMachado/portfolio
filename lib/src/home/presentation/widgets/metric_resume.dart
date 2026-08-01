import 'package:flutter/material.dart';
import 'package:portfolio/core/shared/design/theme/app_colors.dart';
import 'package:portfolio/core/shared/design/theme/app_radius.dart';
import 'package:portfolio/core/shared/design/theme/app_spacings.dart';
import 'package:portfolio/core/shared/design/theme/app_typography.dart';
import 'package:portfolio/src/home/presentation/widgets/metric_resume_model.dart';

import '../../../../l10n/app_localizations.dart';

class MetricResume extends StatelessWidget {
  const MetricResume({super.key});

  @override
  Widget build(BuildContext context) {
    final appText = AppLocalizations.of(context)!;
    final resumeMetrics = getMetricResume(appText);
    return Wrap(
      spacing: AppSpacing.xl,
      children: resumeMetrics.map((item) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 205,
            height: 120,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  width: 100,
                  height: 118,
                  decoration: BoxDecoration(
                    color: item.color,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(AppRadius.lg),
                      topLeft: Radius.circular(AppRadius.lg),
                    ),
                  ),
                ),
                Positioned(
                  left: 5,
                  child: Container(
                    width: 200,
                    height: 120,
                    decoration: BoxDecoration(
                      color: AppColors.onTertiary,
                      borderRadius: BorderRadius.all(
                        Radius.circular(AppRadius.md),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: .center,
                        crossAxisAlignment: .start,
                        children: [
                          Flexible(
                            child: Text(
                              item.title.toUpperCase(),
                              style: AppTypography.headlineXl.copyWith(
                                color: item.color,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Text(
                              item.text.toUpperCase(),
                              style: AppTypography.bodyMd.copyWith(
                                color: AppColors.inversePrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

List<MetricResumeModel> getMetricResume(AppLocalizations appText) {
  return [
    MetricResumeModel(
      title: "04+",
      text: appText.experienceYears,
      color: AppColors.accent,
    ),
    MetricResumeModel(
      title: "14",
      text: appText.appsInProduction,
      color: AppColors.secondary,
    ),
    MetricResumeModel(
      title: "5.6M",
      text: appText.activeUsers,
      color: AppColors.errorContainer,
    ),
    MetricResumeModel(
      title: "110+",
      text: appText.mergedPrs,
      color: AppColors.secondaryFixedDim,
    ),
  ];
}
