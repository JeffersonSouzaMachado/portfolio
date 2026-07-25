import 'package:flutter/material.dart';
import 'package:portfolio/core/design/theme/app_colors.dart';
import 'package:portfolio/core/design/theme/app_radius.dart';
import 'package:portfolio/core/design/theme/app_spacings.dart';
import 'package:portfolio/core/design/theme/app_typography.dart';
import 'package:portfolio/src/home/widgets/metric_resume_model.dart';

class MetricResume extends StatelessWidget {
  const MetricResume({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.xl,
      children: resumeMetrics.map((item) {
        return SizedBox(
          width: 205,
          height: 120,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 100,
                height: 120,
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
        );
      }).toList(),
    );
  }
}

final List<MetricResumeModel> resumeMetrics = [
  MetricResumeModel(
    title: "04+",
    text: "anos de experiência",
    color: AppColors.accent,
  ),
  MetricResumeModel(
    title: "14",
    text: "Apps em produção",
    color: AppColors.secondary,
  ),
  MetricResumeModel(
    title: "5.6M",
    text: "usuários ativos",
    color: AppColors.errorContainer,
  ),
  MetricResumeModel(
    title: "110+",
    text: "PRs Mergeados/ME",
    color: AppColors.secondaryFixedDim,
  ),
];
