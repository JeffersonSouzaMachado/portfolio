import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:portfolio/core/shared/design/theme/app_colors.dart';
import 'package:portfolio/core/shared/design/theme/app_typography.dart';

import '../../l10n/app_localizations.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({super.key, required this.error});

  final Object error;

  Widget errorText({required BuildContext context, bool isTitle = false}) {
    final appText = AppLocalizations.of(context)!;

    if (isTitle) {
      return Text(
        appText.errorLoadingMessage,
        textAlign: TextAlign.center,
        softWrap: true,
        style: AppTypography.bodyLg.copyWith(color: AppColors.errorContainer),
      );
    } else {
      return Text(
        appText.backAgainLater,
        textAlign: TextAlign.center,
        softWrap: true,
        style: AppTypography.headlineMd.copyWith(
          color: AppColors.inversePrimary,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isCompact = constraints.maxWidth < 360;

        return Column(
          mainAxisAlignment: .center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: constraints.hasBoundedWidth
                        ? constraints.maxWidth
                        : 560,
                  ),
                  child: isCompact
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          spacing: 12,
                          children: [
                            Icon(
                              LucideIcons.circleX,
                              color: AppColors.errorContainer,
                            ),
                            errorText(context: context, isTitle: true),
                            errorText(context: context),
                          ],
                        )
                      : Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              LucideIcons.circleX,
                              color: AppColors.errorContainer,
                            ),
                            const SizedBox(width: 20),
                            Flexible(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  errorText(context: context, isTitle: true),
                                  errorText(context: context),
                                ],
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ),
            if (kDebugMode)
              Text(
               '$error',
                style: AppTypography.bodyMd.copyWith(
                  color: AppColors.inversePrimary,
                ),
              ),
          ],
        );
      },
    );
  }
}
