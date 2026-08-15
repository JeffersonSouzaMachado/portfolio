import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/mappers/color_mapper.dart';
import 'package:portfolio/core/shared/design/theme/app_colors.dart';
import 'package:portfolio/core/shared/design/theme/app_radius.dart';
import 'package:portfolio/core/shared/design/theme/app_spacings.dart';
import 'package:portfolio/core/shared/design/theme/app_typography.dart';
import 'package:portfolio/src/home/presentation/providers/home_providers.dart';
import 'package:portfolio/src/shared/error_message.dart';
import 'package:portfolio/src/shared/loading_message.dart';


class MetricResume extends ConsumerWidget {
  const MetricResume({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final language = Localizations.localeOf(context).languageCode;
    final metrics = ref.watch(metricProvider(language));

    return metrics.when(
      error: (error, stackTrace) {
        return ErrorMessage(error: error,);
      },
      loading: () {
        return LoadingMessage();
      },
      data: (metrics) {
        return Wrap(
          spacing: AppSpacing.xl,
          children: metrics.map((item) {
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
                        color: AppColorMapper.color(item.color),
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
                                    color: AppColorMapper.color(item.color),
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
      },
    );
  }
}
